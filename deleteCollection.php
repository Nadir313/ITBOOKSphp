<?php
include("DbConnection.php");
include("index.php") ;
$conn = new DbConnect();
$db = $conn->connection();
$method = $_SERVER['REQUEST_METHOD'];
switch($method) {
    case 'POST':
        $deletedId = json_decode(file_get_contents('php://input'));
        $sql = "DELETE FROM collection
        WHERE id = ?";
        $stmt = $db->prepare($sql);
        $data = $stmt->execute([$deletedId]) ;
        echo json_encode($data);
        break;
    }