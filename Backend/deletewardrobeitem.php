<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");

require_once 'config.php';

$data = json_decode(file_get_contents("php://input"), true);

if (isset($data['id'])) {
    $itemId = $data['id'];

    $sql = "DELETE FROM wardrobe1 WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $itemId);

    if ($stmt->execute()) {
        echo json_encode(["success" => true, "message" => "Item deleted successfully"]);
    } else {
        echo json_encode(["success" => false, "message" => "Failed to delete item"]);
    }

    $stmt->close();
} else {
    echo json_encode(["success" => false, "message" => "Item ID is required"]);
}

$conn->close();
?>