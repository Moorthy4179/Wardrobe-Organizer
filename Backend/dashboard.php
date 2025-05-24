<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require_once 'config.php';

$sqlWardrobeCategories = "SELECT type, COUNT(*) AS count FROM wardrobe1 GROUP BY type";
$resultWardrobeCategories = $conn->query($sqlWardrobeCategories);
$wardrobeItems = [];
while ($row = $resultWardrobeCategories->fetch_assoc()) {
    $wardrobeItems[$row["type"]] = (int)$row["count"];
}

$sqlCalendarMonths = "SELECT DATE_FORMAT(date, '%M') AS month, COUNT(*) AS count FROM calendar GROUP BY month";
$resultCalendarMonths = $conn->query($sqlCalendarMonths);
$calendarDates = [];
while ($row = $resultCalendarMonths->fetch_assoc()) {
    $calendarDates[$row["month"]] = (int)$row["count"];
}

$sqlFavorites = "SELECT COUNT(*) AS favorites FROM favorites";
$resultFavorites = $conn->query($sqlFavorites);
$favorites = $resultFavorites->fetch_assoc()["favorites"];

$response = [
    "success" => true,
    "data" => [
        "wardrobe_items" => $wardrobeItems,
        "calendar_dates" => $calendarDates,
        "favorites" => (int)$favorites
    ]
];

$conn->close();
echo json_encode($response);
?>