<?php


require_once('baseDatos.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['elim'])) {
    $codigo_pedido = intval($_POST['codigo_pedido']);
    
    borrarPedidoCancelado($codigo_pedido);
    // Redirigir de vuelta a la página de administración
    header('Location: ./pedidos.php');
    exit();
}
?>