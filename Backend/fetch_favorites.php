<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");

require_once 'config.php';

$query = "SELECT id, items FROM favorites"; 
$result = $conn->query($query);

$favorites = [];

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $favorites[] = [
            "id" => $row["id"],
            "items" => json_decode($row["items"], true) ?? []
        ];
    }
    echo json_encode(["success" => true, "favorites" => $favorites]);
} else {
    echo json_encode(["success" => false, "message" => "No favorites found"]);
}

$conn->close();
?>