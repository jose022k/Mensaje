<?php

require_once '../modelo/config.php'; 

header('Content-Type: application/json');

$input = json_decode(file_get_contents('php://input'), true);

if (isset($input['titulo'])) {
    $titulo = $input['titulo'];

    // Lógica para eliminar el alquiler de la base de datos según el título
    $stmt = $conn->prepare("DELETE FROM alquiler WHERE titulo = ?");
    $stmt->bind_param("s", $titulo);

    if ($stmt->execute()) {
        echo json_encode(['success' => true]);
    } else {
        echo json_encode(['success' => false, 'error' => 'Error al cancelar el alquiler']);
    }

    $stmt->close();
} else {
    echo json_encode(['success' => false, 'error' => 'Datos inválidos']);
}

$conn->close();
?>
