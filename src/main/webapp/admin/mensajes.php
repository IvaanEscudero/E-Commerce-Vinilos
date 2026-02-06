<?php require_once('baseDatos.php'); ?>
<!DOCTYPE html>
<html lang="es">

<head>
    <title>Admin - Tienda</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/ico" href="../img/as.png">
    <!--Bootstrap 4 CDN-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <!--Font awesome CDN-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
        integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous">

    <!--CSS Estilo-->
    <link rel="stylesheet" type="text/css" href="./css/styleUsuarios.css">
</head>

<body>
<?php session_start();
 require_once('baseDatos.php');
 if (isset($_SESSION['userid'])) {
  $user = $_SESSION['userid'];
  
?>
    <mi-menu></mi-menu>
    <div class="container col">
        <h2>Lista de Mensajes</h2>
        <form class="form-inline" method="post" action="mensajes.php">
            <label for="codigo">Codigo:</label><input type="text" name="codigo" class="form-control mx-2">
            <label for="cod_user">ID Usuario:</label><input type="text" name="cod_user" class="form-control mx-2">
            <label for="nombre">Nombre:</label><input type="text" name="nombre" class="form-control mx-2">
            <label for="email">Email:</label><input type="text" name="email" class="form-control mx-2">
            <label for="mensaje">Mensaje:</label><input type="text" name="mensaje" class="form-control mx-2">
           <button type="submit" class="btn btn-warning">Filtrar</button>
        </form>
        <table id="productTable">
            <thead>
                <tr>
                    <th>ID Mensaje</th>
                    <th>ID Usuario</th>
                    <th>Nombre</th>
                    <th>Email</th>
                    <th>Mensaje</th>
                </tr>
            </thead>
            <tbody>
            <?php
            $query = "SELECT * FROM mensajes WHERE 1=1";
            $params = [];
            $types = "";
            
            if (isset($_POST['codigo']) && !empty($_POST['codigo'])) {
               $query .= " AND codigo_mensaje = ?";
               $params[] = $_POST['codigo'];
               $types .= "i";
            }
            
            if (isset($_POST['cod_user']) && !empty($_POST['cod_user'])) {
               $query .= " AND codigo_usuario = ?";
               $params[] = $_POST['cod_user'];
               $types .= "i";
            }
            
            if (isset($_POST['nombre']) && !empty($_POST['nombre'])) {
               $query .= " AND nombre LIKE ?";
               $params[] = '%' . $_POST['nombre'] . '%';
               $types .= "s";
            }
            
            if (isset($_POST['email']) && !empty($_POST['email'])) {
               $query .= " AND email LIKE ?";
               $params[] = '%' . $_POST['email'] . '%';
               $types .= "s";
            }
            
            if (isset($_POST['mensaje']) && !empty($_POST['mensaje'])) {
               $query .= " AND mensaje LIKE ?";
               $params[] = '%' . $_POST['mensaje'] . '%';
               $types .= "s";
            }
   $resultados = filtrarMensajes($query,$params,$types);
   while ($fila = mysqli_fetch_row($resultados)) {
   ?>
                <tr>
                    
                        <td><?php echo $fila[0];?></td>
                        <td><?php echo $fila[1];?></td>
                        <td><?php echo $fila[2];?></td>
                        <td><?php echo $fila[3];?></td>
                        <td><?php echo $fila[4];?></td>
                        
                </tr>
                <?php
   }
   ?>
            </tbody>
        </table>
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