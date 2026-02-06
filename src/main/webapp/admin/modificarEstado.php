<?php


require_once('baseDatos.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $pedido_id = intval($_POST['pedido_id']);
    $nuevo_estado = $_POST['estado'];

    modificarEstadoPedido($pedido_id,$nuevo_estado);
    // Redirigir de vuelta a la página de administración
    header('Location: ./pedidos.php');
    exit();
}
?>