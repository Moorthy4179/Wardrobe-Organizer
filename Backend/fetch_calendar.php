<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");

require_once 'config.php';

$query = "SELECT date, items FROM calendar";
$result = $conn->query($query);

$data = [];

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $data[] = [
            "date" => $row["date"],
            "items" => json_decode($row["items"], true) 
        ];
    }
    echo json_encode(["success" => true, "calendar" => $data]);
} else {
    echo json_encode(["success" => false, "message" => "No calendar data found"]);
}

$conn->close();
?>