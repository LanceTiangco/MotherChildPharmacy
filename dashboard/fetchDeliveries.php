<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "motherchildpharmacy";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch delivery statuses
$sql = "SELECT PurchaseOrderID, OrderDate, Status FROM purchaseorders WHERE Status IN ('Pending', 'Back Order');"; 
$result = $conn->query($sql);

$deliveries = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $deliveries[] = $row;
    }
}

// Close connection
$conn->close();

// Return data as JSON
header('Content-Type: application/json');
echo json_encode($deliveries);
?>