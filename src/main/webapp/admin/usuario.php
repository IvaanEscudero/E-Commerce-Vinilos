<?php
// Iniciar la sesión
session_start();
require_once('baseDatos.php');
 if (isset($_SESSION['userid'])) {
  $user = $_SESSION['userid'];
// Comprobar si se ha hecho clic en el botón de "Cerrar sesión"
if (isset($_POST['cerrar_sesion'])) {
    // Destruir todas las variables de sesión
    session_unset();
    // Destruir la sesión
    session_destroy();
    // Redirigir al usuario a la página de inicio de sesión
    header('Location: ../indexAdmin.php');
    exit(); // Terminar el script para evitar que se ejecute más código
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin - Tienda</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/ico" href="../img/as.png" >
    <!--Bootstrap 4 CDN-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <!--Font awesome CDN-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
        integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous">

    <!--CSS Estilo-->
    <link rel="stylesheet" type="text/css" href="./css/styleUsuarios.css">
</head>
<body>
    <mi-menu></mi-menu>
    <div>
    <form method="post" action="">
        <input type="submit" name="cerrar_sesion" class="btn btn-danger" value="Cerrar Sesión">
        </form>
    </div>
    <mi-pie></mi-pie>
    <?php 
} else {
  header('Location: ../indexAdmin.php');
}
?>
    <script src="./js/mis-etiquetas.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>
