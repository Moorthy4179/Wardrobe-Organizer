<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");

require_once 'config.php';

if ($_SERVER["REQUEST_METHOD"] === "POST") {

    $input = $_POST;
    $requiredFields = ['name', 'type'];
    $missingFields = array_filter($requiredFields, fn($field) => empty($input[$field]));

    if (!empty($missingFields)) {
        http_response_code(400); 
        echo json_encode([
            "success" => false,
            "message" => "Missing required fields: " . implode(', ', $missingFields)
        ]);
        exit;
    }

    if (isset($_FILES['image'])) {
        $image = $_FILES['image'];
        $imageName = $image['name'];
        $imageTmp = $image['tmp_name'];
        $imageSize = $image['size'];
        $imageError = $image['error'];

        $uploadDir = 'uploads/'; 

        if ($imageError === 0) {
            $imageExtension = pathinfo($imageName, PATHINFO_EXTENSION);
            $imageExtension = strtolower($imageExtension);
            $allowedExtensions = array('jpg', 'jpeg', 'png', 'gif');

            if (in_array($imageExtension, $allowedExtensions)) {
                $newImageName = uniqid('', true) . '.' . $imageExtension;
                $uploadPath = $uploadDir . $newImageName;

                if (move_uploaded_file($imageTmp, $uploadPath)) {
                    $stmt = $conn->prepare("INSERT INTO wardrobe1 (name, type, image_url) VALUES (?, ?, ?)");
                    if (!$stmt) {
                        http_response_code(500);
                        echo json_encode(["success" => false, "message" => "Failed to prepare statement: " . $conn->error]);
                        exit;
                    }

                    $stmt->bind_param(
                        "sss",
                        $input['name'],
                        $input['type'],
                        $newImageName
                    );

                    if ($stmt->execute()) {
                        http_response_code(201);
                        echo json_encode(["success" => true, "message" => "New wardrobe item added successfully", "image_url" => $newImageName]);
                    } else {
                        http_response_code(500);
                        echo json_encode(["success" => false, "message" => "Error inserting item: " . $stmt->error]);
                    }

                    $stmt->close();
                } else {
                    http_response_code(500);
                    echo json_encode(["success" => false, "message" => "Failed to upload image."]);
                }
            } else {
                http_response_code(400);
                echo json_encode(["success" => false, "message" => "Invalid image format."]);
            }
        } else {
            http_response_code(400);
            echo json_encode(["success" => false, "message" => "Error uploading image."]);
        }
    } else {
        http_response_code(400);
        echo json_encode(["success" => false, "message" => "Image not uploaded."]);
    }
} else {
    http_response_code(405);
    echo json_encode(["success" => false, "message" => "Invalid request method. Use POST."]);
}

$conn->close();
?>