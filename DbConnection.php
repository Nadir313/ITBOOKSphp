<?php
    class DbConnect {
        private $server = 'localhost';
        private $dbname = 'bookstore';
        private $user = 'root';
        private $pass = '';
        
        public function connection() {
            try {
                
                $dsn = "mysql:host=$this->server;dbname=$this->dbname" ;
                $conn = new PDO($dsn,$this->user,$this->pass);
                $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                return $conn;
            }
             catch (Exception $err) {
                echo "fatal Error: ". $err->getMessage();
            }
        }
    }
?>