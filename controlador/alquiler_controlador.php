<?php
require_once '../modelo/config.php'; 

header('Content-Type: application/json');

// Verifica si el método de solicitud es POST
if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['action']) && $_GET['action'] === 'getAlquileres') {
    obtenerAlquileres();
} elseif ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action']) && $_POST['action'] === 'cancelarAlquiler') {
    cancelarAlquiler();
} else {
    header('HTTP/1.1 405 Method Not Allowed');
    echo json_encode(['success' => false, 'message' => 'Método no permitido']);
}

function obtenerAlquileres() {
    global $pdo;
    try {
        $stmt = $pdo->query('SELECT titulo_libro AS titulo, costo_libro AS costo, cantidad_libro AS cantidad, duracion FROM alquiler');
        $alquileres = $stmt->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode(['success' => true, 'alquileres' => $alquileres]);
    } catch (PDOException $e) {
        echo json_encode(['success' => false, 'message' => 'Error al obtener los alquileres: ' . $e->getMessage()]);
    }
}

function cancelarAlquiler() {
    global $pdo;
    if (!isset($_POST['titulo'])) {
        echo json_encode(['success' => false, 'message' => 'No se proporcionó el título del libro']);
        exit;
    }
    try {
        $titulo = $_POST['titulo'];
        $stmt = $pdo->prepare('DELETE FROM alquiler WHERE titulo_libro = ?');
        $stmt->execute([$titulo]);
        echo json_encode(['success' => true]);
    } catch (PDOException $e) {
        echo json_encode(['success' => false, 'message' => 'Error al cancelar el alquiler: ' . $e->getMessage()]);
    }
}
?>