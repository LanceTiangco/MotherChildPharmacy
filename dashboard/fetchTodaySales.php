<?php
// Database connection parameters
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

// SQL query to fetch detailed sales data
$sql = "SELECT 
    s.InvoiceID,
    s.SaleDate,
    i.GenericName,
    i.BrandName,
    i.Mass,
    i.UnitOfMeasure,
    JSON_EXTRACT(s.SalesDetails, '$.\"1\".qty') as Quantity,
    s.NetAmount
FROM 
    sales s,
    inventory i
WHERE 
    JSON_UNQUOTE(JSON_EXTRACT(s.SalesDetails, '$.\"1\".itemID')) = i.ItemID
    AND DATE(s.SaleDate) = CURDATE()
ORDER BY 
    s.SaleDate DESC";

$result = $conn->query($sql);

if (!$result) {
    die(json_encode(array(
        "error" => "Query failed",
        "mysql_error" => $conn->error
    )));
}

// Create an array to store the fetched sales data
$salesData = array();
while ($row = $result->fetch_assoc()) {
    $salesData[] = array(
        'InvoiceID' => $row['InvoiceID'],
        'SaleDate' => $row['SaleDate'],
        'GenericName' => $row['GenericName'],
        'BrandName' => $row['BrandName'],
        'Mass' => $row['Mass'],
        'UnitOfMeasure' => $row['UnitOfMeasure'],
        'Quantity' => intval($row['Quantity']),
        'NetAmount' => floatval($row['NetAmount'])
    );
}

// Return data as JSON
header('Content-Type: application/json');
echo json_encode($salesData);

// Close connection
$conn->close();
?>