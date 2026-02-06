<?php
// desactivar_usuario.php

require_once('baseDatos.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['desactivar'])) {
    $usuario_id = intval($_POST['usuario_id']);
    activarDesactivarUsuario($usuario_id);
    // Redirigir de vuelta a la página de administración
    header('Location: ./index.php');
    exit();
}
?>