<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");

require_once 'config.php';

$base_url = "http://localhost/vwobackend/uploads/";

if ($_SERVER["REQUEST_METHOD"] == "GET") {
    if (isset($_GET['id'])) {
        $item_id = intval($_GET['id']);
        $sql = "SELECT id, name, type, image_url FROM wardrobe1 WHERE id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $item_id);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $item = $result->fetch_assoc();
            $item['image_url'] = $base_url . $item['image_url'];

            $recommend_sql = "SELECT id, name, type, image_url FROM wardrobe1 WHERE type = ? AND id != ? LIMIT 5";
            $stmt2 = $conn->prepare($recommend_sql);
            $stmt2->bind_param("si", $item['type'], $item_id);
            $stmt2->execute();
            $recommend_result = $stmt2->get_result();

            $recommendations = [];
            while ($row = $recommend_result->fetch_assoc()) {
                $row['image_url'] = $base_url . $row['image_url'];
                $recommendations[] = $row;
            }

            echo json_encode([
                "success" => true,
                "item" => $item,
                "recommendations" => $recommendations
            ]);
            $stmt2->close();
        } else {
            echo json_encode(["success" => false, "message" => "Outfit not found"]);
        }
        $stmt->close();
    } else {
        $sql = "SELECT id, name, type, image_url FROM wardrobe1";
        $result = $conn->query($sql);

        $outfits = [];
        while ($row = $result->fetch_assoc()) {
            $row['image_url'] = $base_url . $row['image_url'];
            $outfits[] = $row;
        }

        echo json_encode(["success" => true, "outfits" => $outfits]);
    }
} else {
    echo json_encode(["success" => false, "message" => "Invalid request method"]);
}

$conn->close();
?>