<?php

require_once '../modelo/User.php';

// Obtener datos del formulario de registro
$nombre = $_POST['nombre'] ?? null;
$apellido = $_POST['apellido'] ?? null;
$direccion = $_POST['direccion'] ?? null;
$usuario = $_POST['usuario'] ?? null;
$contraseña = $_POST['contraseña'] ?? null;

// Verificar que todos los campos tienen datos
if (!$nombre || !$apellido || !$direccion || !$usuario || !$contraseña) {
    header("Location: ../vista/registro.php?error=1");
    exit;
}

// Codificar la contraseña antes de guardarla
$contraseñaCodificada = password_hash($contraseña, PASSWORD_DEFAULT);

// Crear un nuevo usuario
$user = new User($nombre, $apellido, $direccion, $usuario, $contraseñaCodificada);


if ($user->save()) {
    // Iniciar sesión y redirigir al usuario al registro con éxito
    session_start();
    $_SESSION['user'] = $user;
    header("Location: ../vista/registro.php?success=1");
    exit;
} else {
    
    header("Location: ../vista/registro.php?error=1");
    exit;
}
?>
