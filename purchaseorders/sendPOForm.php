<?php
session_start(); // Start the session
$accountID = $_SESSION['AccountID'];
$sessionAccountID = $_SESSION['AccountID'] ?? null;

header('Content-Type: application/json');

function logAction($pdo, $userId, $action, $description, $status)
{
    $sql2 = "INSERT INTO audittrail (AccountID, action, description, ip_address, status) VALUES (?, ?, ?, ?, ?)";
    $stmt2 = $pdo->prepare($sql2);
    $ipAddress = $_SERVER['REMOTE_ADDR'];
    $stmt2->execute([$userId, $action, $description, $ipAddress, $status]);
}


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Database connection
    require_once "../users/databaseHandler.php"; // Ensure you have a database connection setup in this file

    // Retrieve POST data
    $supplierName = $_POST["supplierSelect"];
    $orderDetails = $_POST["orderDetails"];
    $totalItems = $_POST["totalItems"];
    $newOrderID = $_POST["newOrderID"];

    if (isset($_POST['orderDetails'])) {
        $orderDetails = json_decode($orderDetails, true); // Decode JSON to associative array
    }

    // Prepare to get SupplierID based on SupplierName
    $sqlSupplier = "SELECT SupplierID FROM suppliers WHERE SupplierName = ?";
    $stmtSupplier = $pdo->prepare($sqlSupplier);
    $stmtSupplier->execute([$supplierName]);
    $supplierID = $stmtSupplier->fetchColumn();

    if ($supplierID === false) {
        // Log failure
        $description = "Failed to create purchase order. Error: Supplier not found.";
        logAction($pdo, $sessionAccountID, 'Create Order', $description, 0);
        echo json_encode(['success' => false, 'message' => 'Supplier not found.']);
        exit();
    }

    // Prepare to insert into purchaseorders
    $sql = "INSERT INTO purchaseorders (SupplierID, AccountID, OrderDetails, TotalItems) VALUES (?, ?, ?, ?)";
    $stmt = $pdo->prepare($sql);

    // Execute the statement
    try {
        $stmt->execute([$supplierID, $accountID, $orderDetails, $totalItems]);

        $orderDetailsArray = json_decode($orderDetails, true); // Decode JSON to associative array

        // Now update the inventory
        foreach ($orderDetailsArray as $detail) {
            $itemID = $detail['itemID'];
            $quantity = $detail['qty'];

            // Prepare the update statement for the inventory table
            $sqlUpdate = "UPDATE inventory SET Ordered = Ordered + ? WHERE ItemID = ?";
            $stmtUpdate = $pdo->prepare($sqlUpdate);
            $stmtUpdate->execute([$quantity, $itemID]);

            // Check the current ReorderLevel for the item
            $sqlCheckReorder = "SELECT ReorderLevel FROM inventory WHERE ItemID = ?";
            $stmtCheckReorder = $pdo->prepare($sqlCheckReorder);
            $stmtCheckReorder->execute([$itemID]);
            $currentReorderLevel = $stmtCheckReorder->fetchColumn();

            // If ReorderLevel is 0, update it to 50% of the quantity in the new order
            if ($currentReorderLevel == 0) {
                $newReorderLevel = ceil($quantity * 0.5); // Round up to the nearest whole number

                $sqlUpdateReorder = "UPDATE inventory SET ReorderLevel = ? WHERE ItemID = ?";
                $stmtUpdateReorder = $pdo->prepare($sqlUpdateReorder);
                $stmtUpdateReorder->execute([$newReorderLevel, $itemID]);
            }

        }

        $updatedetails = "(OrderID: " . $newOrderID . ")";

        $description = "Created purchase order $updatedetails.";
        // Log success
        logAction($pdo, $sessionAccountID, 'Create Order', $description, 1);

        echo json_encode(['success' => true, 'message' => 'Purchase order added and inventory updated successfully.']);
    } catch (PDOException $e) {
        // Log failure
        $description = "Failed to create purchase order. Error: " . $e->getMessage();
        logAction($pdo, $sessionAccountID, 'Create Order', $description, 0);
        echo json_encode(['success' => false, 'message' => 'Error adding purchase order: ' . $e->getMessage()]);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Invalid request method.']);
}
