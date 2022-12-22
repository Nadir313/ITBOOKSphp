<?php
include("DbConnection.php");
include("index.php") ;
$conn = new DbConnect();
$db = $conn->connection();
$method = $_SERVER['REQUEST_METHOD'];
// session_start() ;
switch($method) {
    case 'POST':
        $wishlistbookdata = json_decode(file_get_contents('php://input'));
        $sql = "INSERT INTO wishlist(id, Image,Title,SubTitle,UserId)
         values(null, :Image, :title, :subtitle,:UserId)";
        $stmt = $db->prepare($sql);
        $stmt->bindParam(':Image', $wishlistbookdata->Image);
        $stmt->bindParam(':title', $wishlistbookdata->title);
        $stmt->bindParam(':subtitle', $wishlistbookdata->subtitle);
        $stmt->bindParam(':UserId', $wishlistbookdata->userId);
        if($stmt->execute()) {
            $data = ['status' => 1, 'message' => "Record successfully created"];
        } else {
            $data = ['status' => 0, 'message' => "Failed to create record."];
        }
        echo json_encode($data);
        break;
    case "GET" :
        $wishlistbookdata = json_decode(file_get_contents("php://input")) ;
        $sql = "SELECT * FROM wishlist WHERE userId = ?" ;
        $stmt = $db->prepare($sql) ;
        $id = (int) $_GET['userId'] ;
        $stmt->execute([$id]) ;
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC) ;
        echo json_encode($data, true) ;
        break;
    }