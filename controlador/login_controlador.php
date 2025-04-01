<?php

require_once '../modelo/User.php';

session_start();

$action = isset($_GET['action']) ? $_GET['action'] : '';

switch ($action) {
    case 'checkSession':
        checkSession();
        break;
    default:
        login();
}

function login() {
   
    $usuario = $_POST['usuario'];
    $contrasena = $_POST['contrasena'];

  
    $user = User::find($usuario, $contrasena);

    if ($user) {
        $_SESSION['user'] = [
            'id' => $user->id,
            'username' => $user->usuario,
            
        ];
        header("Location: ../vista/login.php?success=1");
        exit;
    } else {

        header("Location: ../vista/login.php?error=1");
        exit();
    }
}

function checkSession() {
    if (isset($_SESSION['user'])) {
        echo json_encode(['success' => true, 'loggedIn' => true]);
    } else {
        echo json_encode(['success' => true, 'loggedIn' => false]);
    }
}
?>
