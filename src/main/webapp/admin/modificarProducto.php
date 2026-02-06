<?php


require_once('baseDatos.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['modCambios'])) {
    $producto_id = intval($_POST['producto_id']);
    $descripcion = $_POST['descripcion'];
    $precio = floatval($_POST['precio']);
    $existencias = intval($_POST['existencias']);
    $imagen = $_POST['imagen'];
    $tipo = $_POST['tipo'];
    
    modificarProductos($producto_id,$descripcion,$precio,$existencias,$imagen,$tipo);
    // Redirigir de vuelta a la página de administración
    header('Location: ./productos.php');
    exit();
}
?>