<?php
session_start(); // Inicia la sesión PHP

// Verifica si hay un mensaje de error en la sesión
if (isset($_SESSION['error'])) {
    $err = $_SESSION['error'];
    unset($_SESSION['error']); // Elimina el mensaje de error de la sesión para que no se muestre nuevamente
}
?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Iniciar Sesión - Admin</title>
    <link rel="icon" type="image/ico" href="./web/img/as.png" >
    <!--Bootstrap 4 CDN-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <!--Font awesome CDN-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
        integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous">

    <!--CSS Estilo-->
    <link rel="stylesheet" type="text/css" href="./web/css/stylelogin.css">
</head>

<body>
    <div class="container">
        <div class="d-flex justify-content-center align-items-center h-100">
            <div class="card">
                <div class="card-header">
                    <h4 class="text-left">Iniciar Sesión - Admin</h4>
                    <div class="d-flex justify-content-end social_icon">
                        <span><i class="fab fa-youtube-square"></i></span>
                        <span><i class="fab fa-instagram-square"></i></span>
                        <span><i class="fab fa-twitter-square"></i></span>
                    </div>
                </div>
                <div class="card-body">
                    <form method="post" action="./admin/validar.php">
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                            </div>
                            <input type="text" class="form-control" name="usuario" placeholder="Usuario">
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-key"></i></span>
                            </div>
                            <input type="password" class="form-control" name="clave" placeholder="Contraseña">
                        </div>
                        <div class="form-group mt-5">
                            
                            <input type="submit" value="Iniciar Sesión" class="btn float-left login_btn">
                            <input type="button" value="Cancelar" class="btn float-right login_btn" onclick="window.location.href = './index.jsp'">
                            <?php
                                if(isset($err)){
                            ?>
                            <p style="color: red"><?php echo $err;?></p>
                            <?php
                            }
                            ?>
                            
                        </div>
                    </form>
                </div>
                <div class="card-footer">
                    <div class="d-flex justify-content-center">
                        <a href="#">No recuerdas tu contraseña?</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <mi-pie></mi-pie>
    <script src="./web/js/events.js"></script>
    <script src="./web/js/mis-etiquetas.js"></script>
    <script src="./web/js/carrito.js"></script>
</body>

</html>