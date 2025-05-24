<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");

require_once 'config.php';

$data = json_decode(file_get_contents("php://input"), true);

if (!isset($data["selectedItems"]) || empty($data["selectedItems"]) || !isset($data["date"])) {
    echo json_encode(["success" => false, "message" => "Invalid data received"]);
    exit;
}

$date = $data["date"]; 
$selectedItems = json_encode($data["selectedItems"]);

$sql = "INSERT INTO calendar (items, date) VALUES (?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ss", $selectedItems, $date);

if ($stmt->execute()) {
    echo json_encode(["success" => true, "message" => "Items saved to calendar"]);
} else {
    echo json_encode(["success" => false, "message" => "Error saving item: " . $stmt->error]);
}

$stmt->close();
$conn->close();
?>