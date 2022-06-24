<?php
include("DbConnection.php");
include("index.php") ;
    $conn = new DbConnect();
    $db = $conn->connection();
    $method = $_SERVER['REQUEST_METHOD'];
    switch($method) {
        case 'POST':
            $user = json_decode(file_get_contents('php://input'));
            $sql = "INSERT INTO theuser(id, fullName, Email,Profession,Image,Pass_word) 
                    values(null, :fullName, :Email, :Profession, :Image, :Pass_word)";
            $stmt = $db->prepare($sql);
            $stmt->bindParam(':fullName', $user->fullName);
            $stmt->bindParam(':Email', $user->Email);
            $stmt->bindParam(':Profession', $user->Profession);
            $stmt->bindParam(':Image', $user->Image);
            $stmt->bindParam(':Pass_word', $user->Password); // md5()
            if($stmt->execute()) {
                $data = ['status' => 1, 'message' => "Record successfully created"];
            } else {
                $data = ['status' => 0, 'message' => "Failed to create record."];
            }
            echo json_encode($data);
            break;
}

