<?php
require_once '../modelo/config.php';

header('Content-Type: application/json'); 
try {
    if (isset($_GET['titulo'])) {
        $titulo = $_GET['titulo'];

        $stmt = $pdo->prepare("SELECT costo FROM libro WHERE titulo = :titulo");
        $stmt->bindParam(':titulo', $titulo);
        $stmt->execute();
        $libro = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($libro) {
            echo json_encode(['costo' => $libro['costo']]);
        } else {
            echo json_encode(['costo' => 0]);
        }
    } else {
        throw new Exception('Título no especificado');
    }
} catch (Exception $e) {
    echo json_encode(['error' => $e->getMessage()]);
}
?>
