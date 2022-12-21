<?php
include("DbConnection.php");
include("index.php") ;
    // echo "testin here ";
    $conn = new DbConnect();
    $db = $conn->connection();
    $method = $_SERVER['REQUEST_METHOD'];
    switch($method){ 
        case 'POST':
            $user = json_decode(file_get_contents('php://input'),true) ;
            $email = $user['email'];
            $psd = md5($user['password']) ;
            $sql = "SELECT * FROM theuser WHERE Email = :email AND Pass_word = :psd" ;
            $stmt = $db->prepare($sql);
            $stmt->bindParam(':email', $email,PDO::PARAM_STR);
            $stmt->bindParam(':psd', $psd); 
            $stmt->execute() ;
            $data = $stmt->fetchAll(PDO::FETCH_ASSOC) ;
            echo json_encode($data[0]) ;
            break;
            }