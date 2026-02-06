<?php


require_once('baseDatos.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['modificar'])) {
    $usuario_id = intval($_POST['usuario_id']);
    $nombre = $_POST['nombre'];
    $apellidos = $_POST['apellidos'];
    $domicilio = $_POST['domicilio'];
    $poblacion = $_POST['poblacion'];
    $provincia = $_POST['provincia'];
    $cp = intval($_POST['cp']);
    $telefono = intval($_POST['telefono']);
    
    modificarUsuarios($usuario_id,$nombre,$apellidos,$domicilio,$poblacion,$provincia,$cp, $telefono);
    // Redirigir de vuelta a la página de administración
    header('Location: ./index.php');
    exit();
}
?>