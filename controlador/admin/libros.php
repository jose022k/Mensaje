<?php
require_once '../../modelo/config.php'; 
header('Content-Type: application/json');

function leerLibros($pdo) {
    error_log("Entrando a la función leerLibros");
    try {
        $stmt = $pdo->query("SELECT * FROM libro");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        error_log("Error en la consulta: " . $e->getMessage());
        return [];
    }
}

function leerLibroPorId($pdo, $id) {
    error_log("Entrando a la función leerLibroPorId con ID: " . $id);
    try {
        $stmt = $pdo->prepare("SELECT * FROM libro WHERE id = ?");
        $stmt->execute([$id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        error_log("Error al leer el libro por ID: " . $e->getMessage());
        return null;
    }
}

function crearLibro($pdo, $data) {
    error_log("Entrando a la función crearLibro");
    try {
        $stmt = $pdo->prepare("INSERT INTO libro (titulo, autor, genero, costo, año_lanzamiento) VALUES (?, ?, ?, ?, ?)");
        $stmt->execute([$data['titulo'], $data['autor'], $data['genero'], $data['costo'], $data['año_lanzamiento']]);
        return $pdo->lastInsertId();
    } catch (PDOException $e) {
        error_log("Error al crear el libro: " . $e->getMessage());
        return false;
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    error_log("Método POST detectado");
    $data = json_decode(file_get_contents("php://input"), true);
    $nuevoId = crearLibro($pdo, $data);
    if ($nuevoId !== false) {
        echo json_encode(["success" => true, "id" => $nuevoId]);
    } else {
        echo json_encode(["success" => false, "message" => "Error al crear el libro"]);
    }
}

function actualizarLibro($pdo, $data) {
    error_log("Entrando a la función actualizarLibro");
    try {
        $stmt = $pdo->prepare("UPDATE libro SET titulo = ?, autor = ?, genero = ?, costo = ?, año_lanzamiento = ? WHERE id = ?");
        return $stmt->execute([$data['titulo'], $data['autor'], $data['genero'], $data['costo'], $data['año_lanzamiento'], $data['id']]);
    } catch (PDOException $e) {
        error_log("Error al actualizar el libro: " . $e->getMessage());
        return false;
    }
}

function eliminarLibro($pdo, $id) {
    error_log("Entrando a la función eliminarLibro con ID: " . $id);
    try {
        $stmt = $pdo->prepare("DELETE FROM libro WHERE id = ?");
        return $stmt->execute([$id]);
    } catch (PDOException $e) {
        error_log("Error al eliminar el libro: " . $e->getMessage());
        return false;
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    error_log("Método GET detectado");
    if (isset($_GET['id'])) {
        $libro = leerLibroPorId($pdo, $_GET['id']);
        echo json_encode($libro);
    } else {
        $libros = leerLibros($pdo);
        echo json_encode($libros);
    }
} elseif ($_SERVER['REQUEST_METHOD'] === 'POST') {
    error_log("Método POST detectado");
    $data = json_decode(file_get_contents("php://input"), true);
    $nuevoId = crearLibro($pdo, $data);
    if ($nuevoId !== false) {
        echo json_encode(["success" => true, "id" => $nuevoId]);
    } else {
        echo json_encode(["success" => false, "message" => "Error al crear el libro"]);
    }
} elseif ($_SERVER['REQUEST_METHOD'] === 'PUT') {
    error_log("Método PUT detectado");
    $data = json_decode(file_get_contents("php://input"), true);
    $resultado = actualizarLibro($pdo, $data);
    if ($resultado) {
        echo json_encode(["success" => true]);
    } else {
        echo json_encode(["success" => false, "message" => "Error al actualizar el libro"]);
    }
} elseif ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
    error_log("Método DELETE detectado");
    $data = json_decode(file_get_contents("php://input"), true);
    if (isset($data["id"])) {
        $id = $data["id"];
        $resultado = eliminarLibro($pdo, $id);
        if ($resultado) {
            echo json_encode(["success" => true]);
        } else {
            echo json_encode(["success" => false, "message" => "Error al eliminar el libro"]);
        }
    }
}
?>
