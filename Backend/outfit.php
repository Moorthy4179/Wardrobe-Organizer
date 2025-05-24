<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");

require_once 'config.php';

if ($_SERVER["REQUEST_METHOD"] == "GET") {
    $base_url = "http://localhost/uploads/"; 
    $sql = "SELECT id, name, type, image_url FROM wardrobe1";
    $result = $conn->query($sql);
    
    if ($result->num_rows > 0) {
        $items = [];
        while ($row = $result->fetch_assoc()) {
            if (!empty($row['image_url'])) {
                $row['image_url'] = $base_url . $row['image_url'];
            }
            $items[] = $row;
        }
        echo json_encode(["success" => true, "items" => $items]);
    } else {
        echo json_encode(["success" => false, "message" => "No items found"]);
    }
} else {
    echo json_encode(["success" => false, "message" => "Invalid request method"]);
}

$conn->close();
?>