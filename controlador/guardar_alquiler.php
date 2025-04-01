<?php
require_once '../modelo/config.php';
require_once '../modelo/User.php';

session_start();

// Verificar si el usuario está autenticado
if (!isset($_SESSION['user'])) {
    echo json_encode(['error' => 'Usuario no autenticado']);
    exit();
}

// Verificar el contenido de la sesión
$user = $_SESSION['user'];

if (!isset($user['id'])) {
    echo json_encode(['error' => 'Datos de usuario no válidos en la sesión']);
    exit();
}

$user_id = $user['id'];

$input = file_get_contents('php://input');
$data = json_decode($input, true);

// Verificar si existen datos de alquiler en la solicitud JSON
if (!isset($data['alquileres'])) {
    echo json_encode(['error' => 'No se encontraron datos de alquiler']);
    exit();
}

$alquileres = $data['alquileres'];

try {
    $pdo->beginTransaction();

    foreach ($alquileres as $alquiler) {
        $titulo = $alquiler['titulo'];
        $cantidad = $alquiler['cantidad'];
        $duracion = $alquiler['duracion'];
        $costo_libro = $alquiler['costo'] . ' Bs'; 

        $stmt = $pdo->prepare("INSERT INTO alquiler (user_id, cantidad_libro, titulo_libro, duracion, costo_libro) VALUES (:user_id, :cantidad_libro, :titulo_libro, :duracion, :costo_libro)");
        $stmt->bindParam(':user_id', $user_id);
        $stmt->bindParam(':cantidad_libro', $cantidad);
        $stmt->bindParam(':titulo_libro', $titulo);
        $stmt->bindParam(':duracion', $duracion);
        $stmt->bindParam(':costo_libro', $costo_libro);
        $stmt->execute();
    }

    $pdo->commit();
    echo json_encode(['success' => true]);
} catch (Exception $e) {
    $pdo->rollBack();
    echo json_encode(['error' => 'Error al guardar el alquiler: ' . $e->getMessage()]);
    error_log('Error al guardar el alquiler: ' . $e->getMessage());
}

?>
