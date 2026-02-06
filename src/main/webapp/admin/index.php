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
<?php session_start();
 require_once('baseDatos.php');
 if (isset($_SESSION['userid'])) {
  $user = $_SESSION['userid'];
  
?>
    <mi-menu></mi-menu>
    <div class="container col">
        <h2>Usuarios</h2>
        <div class="form-group row">
        <form class="form-inline" method="post" action="index.php">
            <div class="col-sm">
              <label for="codigo">Codigo:</label><input type="text" name="codigo" class="form-control mx-2">
              <label for="activo">Activo:</label><input type="text" name="activo" class="form-control mx-2">
            </div>
            <div class="col-sm">
              <label for="admin">admin:</label><input type="text" name="admin" class="form-control mx-2">
              <label for="usuario">usuario:</label><input type="text" name="usuario" class="form-control mx-2">
            </div>
            <div class="col-sm">
              <label for="nombre">nombre:</label><input type="text" name="nombre" class="form-control mx-2">
              <label for="apellidos">apellidos:</label><input type="text" name="apellidos" class="form-control mx-2">
            </div>
            <div class="col-sm">
              <label for="domicilio">domicilio:</label><input type="text" name="domicilio" class="form-control mx-2">
              <label for="poblacion">poblacion:</label><input type="text" name="poblacion" class="form-control mx-2">
            </div>
            <div class="col-sm">
              <label for="provincia">provincia:</label><input type="text" name="provincia" class="form-control mx-2">
              <label for="cp">CP:</label><input type="text" name="cp" class="form-control mx-2">
            </div>
            <div class="col-sm">
              <label for="telefono">telefono:</label><input type="text" name="telefono" class="form-control mx-2">
              <button type="submit" class="btn btn-warning btn-block" style="margin-top: 20px">Filtrar usuarios</button>
            </div>
          </form>
        </div>
        <table class="userTable">
          <thead>
            <tr>
              <th>ID</th>
              <th>Activo</th>
              <th>admin</th>
              <th>usuario</th>
              <th>nombre</th>
              <th>apellidos</th>
              <th>domicilio</th>
              <th>poblacion</th>
              <th>provincia</th>
              <th>CP</th>
              <th>telefono</th>
              <th>Acciones</th>
            </tr>
          </thead>
          <tbody>
          <?php

$query = "SELECT * FROM usuarios WHERE 1=1";
$params = [];
$types = "";

if (isset($_POST['codigo']) && !empty($_POST['codigo'])) {
   $query .= " AND codigo = ?";
   $params[] = $_POST['codigo'];
   $types .= "i";
}

if (isset($_POST['activo']) && !empty($_POST['activo'])) {
   $query .= " AND activo = ?";
   $params[] = $_POST['activo'];
   $types .= "i";
}

if (isset($_POST['admin']) && !empty($_POST['admin'])) {
   $query .= " AND admin = ?";
   $params[] = $_POST['admin'];
   $types .= "i";
}

if (isset($_POST['usuario']) && !empty($_POST['usuario'])) {
   $query .= " AND usuario = ?";
   $params[] = $_POST['usuario'];
   $types .= "s";
}

if (isset($_POST['nombre']) && !empty($_POST['nombre'])) {
   $query .= " AND nombre LIKE ?";
   $params[] = '%' . $_POST['nombre'] . '%';
   $types .= "s";
}

if (isset($_POST['apellidos']) && !empty($_POST['apellidos'])) {
   $query .= " AND apellidos LIKE ?";
   $params[] = '%' . $_POST['apellidos'] . '%';
   $types .= "s"; 
}
if (isset($_POST['domicilio']) && !empty($_POST['domicilio'])) {
  $query .= " AND domicilio LIKE ?";
  $params[] = '%' . $_POST['domicilio'] . '%';
  $types .= "s"; 
}
if (isset($_POST['poblacion']) && !empty($_POST['poblacion'])) {
  $query .= " AND poblacion LIKE ?";
  $params[] = '%' . $_POST['poblacion'] . '%';
  $types .= "s"; 
}

if (isset($_POST['provincia']) && !empty($_POST['provincia'])) {
  $query .= " AND provincia LIKE ?";
  $params[] = '%' . $_POST['provincia'] . '%';
  $types .= "s"; 
}
if (isset($_POST['cp']) && !empty($_POST['cp'])) {
  $query .= " AND cp = ?";
  $params[] = $_POST['provincia'];
  $types .= "i"; 
}
if (isset($_POST['telefono']) && !empty($_POST['telefono'])) {
  $query .= " AND telefono = ?";
  $params[] =$_POST['telefono'];
  $types .= "i"; 
}

   $resultados = filtrarUsuarios($query,$params,$types);
   while ($fila = mysqli_fetch_row($resultados)) {
   ?>
            <tr>
            <form method="post" action="modificarUsuarios.php">
              <td><?php echo $fila[0];?></td>
              <td><?php echo ($fila[1] == 1) ? 'Activo' : 'Inactivo'; ?></td>
              <td><?php echo $fila[2];?></td>
              <td><?php echo $fila[3];?></td>
              <td><input type="text" name="nombre" class="form-control form-control-sm" value="<?php echo $fila[5];?>"></td>
              <td><input type="text" name="apellidos" class="form-control form-control-sm" value="<?php echo $fila[6];?>"></td>
              <td><input type="text" name="domicilio" class="form-control form-control-sm" value="<?php echo $fila[7];?>"></td>
              <td><input type="text" name="poblacion" class="form-control form-control-sm" value="<?php echo $fila[8];?>"></td>
              <td><input type="text" name="provincia" class="form-control form-control-sm" value="<?php echo $fila[9];?>"></td>
              <td><input type="text" name="cp" class="form-control form-control-sm" value="<?php echo $fila[10];?>"></td>
              <td><input type="text" name="telefono" class="form-control form-control-sm" value="<?php echo $fila[11];?>"></td>
                <td>
                <input type="hidden" name="usuario_id" value="<?php echo $fila[0]; ?>">
                <button type="submit" name="modificar" class="btn btn-info">Guardar cambios</button>
            </form>
                <form method="post" action="desactivarUsuario.php" class="inline-form">
                  <input type="hidden" name="usuario_id" value="<?php echo $fila[0]; ?>">
                  <button type="submit" name="desactivar" class="btn btn-warning">
                    <?php echo ($fila[1] == 1) ? 'Desactivar' : 'Activar'; ?>
                  </button>
                </form>
              </td>
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
    <style>
    .inline-form {
        display: inline;
    }
    .form-control-sm {
        width: 100px; /* Ajusta este valor según sea necesario */
    }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>
