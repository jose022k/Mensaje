<?php
require_once '../../modelo/config.php'; 
header('Content-Type: application/json');

function leerAlquileres($pdo) {
    try {
        $stmt = $pdo->query("SELECT * FROM alquiler");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        error_log("Error en la consulta: " . $e->getMessage());
        return [];
    }
}

function eliminarAlquiler($pdo, $id) {
    try {
        $stmt = $pdo->prepare("DELETE FROM alquiler WHERE id = ?");
        $stmt->execute([$id]);
        return true;
    } catch (PDOException $e) {
        error_log("Error al eliminar el alquiler: " . $e->getMessage());
        return false;
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    if (isset($_GET['action']) && $_GET['action'] == 'leer') {
        $alquileres = leerAlquileres($pdo);
        echo json_encode($alquileres);
    }
} elseif ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
    $data = json_decode(file_get_contents("php://input"), true);
    if (isset($data["id"])) {
        $id = $data["id"];
        $resultado = eliminarAlquiler($pdo, $id);
        if ($resultado) {
            echo json_encode(["success" => true]);
        } else {
            echo json_encode(["success" => false, "message" => "Error al eliminar el alquiler"]);
        }
    }
}
?>
