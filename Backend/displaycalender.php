<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");

require_once 'config.php';

$sql = "SELECT id, date, items FROM calendar";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $calendarData = [];

    while ($row = $result->fetch_assoc()) {
        $row['items'] = json_decode($row['items'], true) ?? []; // Ensure it's always an array
        $calendarData[] = $row;
    }

    echo json_encode(["success" => true, "data" => $calendarData]);
} else {
    echo json_encode(["success" => false, "message" => "No data found"]);
}

$conn->close();
?>