<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");

require_once 'config.php';

$data = json_decode(file_get_contents("php://input"), true);

if (!isset($data["selectedItems"]) || empty($data["selectedItems"])) {
    echo json_encode(["success" => false, "message" => "No items received"]);
    exit;
}

$selectedItems = json_encode($data["selectedItems"]);

$sql = "INSERT INTO favorites (items) VALUES (?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $selectedItems);

if ($stmt->execute()) {
    echo json_encode(["success" => true, "message" => "Items saved to favorites"]);
} else {
    echo json_encode(["success" => false, "message" => "Error saving item: " . $stmt->error]);
}

$stmt->close();
$conn->close();
?>