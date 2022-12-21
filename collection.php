<?php
include("DbConnection.php");
include("index.php") ;
$conn = new DbConnect();
$db = $conn->connection();
$method = $_SERVER['REQUEST_METHOD'];

switch($method) {
    case 'POST':
        $collectionbookdata = json_decode(file_get_contents('php://input'));
        $sql = "INSERT INTO collection(id, Image,Title,SubTitle,UserId)
                values(null, :Image, :title, :subtitle,:UserId)";
        $stmt = $db->prepare($sql);
        $stmt->bindParam(':Image', $collectionbookdata->Image);
        $stmt->bindParam(':title', $collectionbookdata->title);
        $stmt->bindParam(':subtitle', $collectionbookdata->subtitle);
        $stmt->bindParam(':UserId', $collectionbookdata->userId);
        if($stmt->execute()) {
            $data = ['status' => 1, 'message' => "Record successfully created"];
        } else {
            $data = ['status' => 0, 'message' => "Failed to create record."];
        }
        echo json_encode($data);
        break;
    case "GET" :
        $collectionbookdata = json_decode(file_get_contents('php://input'));
        $sql = "SELECT * from collection 
                WHERE UserId = ?" ;
        $stmt = $db->prepare($sql) ;
        $id = (int) $_GET['userId'] ;
        $stmt->execute([$id]) ;
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC) ;
        echo json_encode($data, true);
        break;
    }