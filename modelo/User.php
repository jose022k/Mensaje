<?php

class User {
    
    public $id;
    public $nombre;
    public $apellido;
    public $direccion;
    public $usuario;
    public $contrasena;


    public function __construct($nombre = null, $apellido = null, $direccion = null, $usuario = null, $contrasena = null) {
        $this->nombre = $nombre;
        $this->apellido = $apellido;
        $this->direccion = $direccion;
        $this->usuario = $usuario;
        $this->contrasena = $contrasena;
    }

    // Guardar usuario
    public function save() {
        // Conectar a la base de datos
        try {
            $conn = new PDO("mysql:host=localhost:3306;dbname=bookends", "root", "");
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            // Preparar y ejecutar la consulta
            $stmt = $conn->prepare("INSERT INTO user (nombre, apellido, direccion, usuario, contrasena) VALUES (?, ?, ?, ?, ?)");
            $resultado = $stmt->execute([$this->nombre, $this->apellido, $this->direccion, $this->usuario, $this->contrasena]);

            return $resultado;
        } catch (PDOException $e) {
            echo "Error: " . $e->getMessage();
            return false;
        }
    }

    // Encontrar usuario
    public static function find($usuario, $contrasena) {
        try {
            
            $conn = new PDO("mysql:host=localhost:3306;dbname=bookends", "root", "");
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            // Preparar y ejecutar la consulta
            $stmt = $conn->prepare("SELECT * FROM user WHERE usuario = ?");
            $stmt->execute([$usuario]);

            $user = $stmt->fetch(PDO::FETCH_OBJ);

            if ($user && password_verify($contrasena, $user->contrasena)) {
              
                $userObj = new User();
                $userObj->id = $user->id;
                $userObj->nombre = $user->nombre;
                $userObj->apellido = $user->apellido;
                $userObj->direccion = $user->direccion;
                $userObj->usuario = $user->usuario;
                $userObj->contrasena = $user->contrasena;

                
                return $userObj;
            }

            
            return null;
        } catch (PDOException $e) {
            echo "Error: " . $e->getMessage();
            return null;
        }
    }
}
?>
