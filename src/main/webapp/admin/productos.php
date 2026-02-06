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
        <h2>Lista de Productos</h2>
        <form class="form-inline" method="post" action="productos.php">
            <label for="codigo">Codigo:</label><input type="text" name="codigo" class="form-control mx-2">
            <label for="descripcion">Descripcion:</label><input type="text" name="descripcion" class="form-control mx-2">
            <label for="precio">Precio:</label><input type="text" name="precio" class="form-control mx-2">
            <label for="existencias">Existencias:</label><input type="text" name="existencias" class="form-control mx-2">
            <label for="imagen">Imagen:</label><input type="text" name="imagen" class="form-control mx-2">
            <label for="tipo">Tipo:</label><input type="text" name="tipo" class="form-control mx-2">
            <button type="submit" class="btn btn-warning">Filtrar</button>
        </form>
        <table id="productTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Descripcion</th>
                    <th>Precio</th>
                    <th>Existencias</th>
                    <th>Imagen</th>
                    <th>Tipo</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
            <?php
 $query = "SELECT * FROM productos WHERE 1=1";
 $params = [];
 $types = "";

 if (isset($_POST['codigo']) && !empty($_POST['codigo'])) {
    $query .= " AND codigo = ?";
    $params[] = $_POST['codigo'];
    $types .= "i";
}

if (isset($_POST['descripcion']) && !empty($_POST['descripcion'])) {
    $query .= " AND descripcion LIKE ?";
    $params[] = '%' . $_POST['descripcion'] . '%';
    $types .= "s";
}

if (isset($_POST['precio']) && !empty($_POST['precio'])) {
    $query .= " AND precio = ?";
    $params[] = $_POST['precio'];
    $types .= "d";
}

if (isset($_POST['existencias']) && !empty($_POST['existencias'])) {
    $query .= " AND existencias = ?";
    $params[] = $_POST['existencias'];
    $types .= "i";
}

if (isset($_POST['imagen']) && !empty($_POST['imagen'])) {
    $query .= " AND imagen LIKE ?";
    $params[] = '%' . $_POST['imagen'] . '%';
    $types .= "s";
}

if (isset($_POST['tipo']) && !empty($_POST['tipo'])) {
    $query .= " AND tipo = ?";
    $params[] = $_POST['tipo'];
    $types .= "s"; 
}
   $resultados = filtrarProductos($query,$params,$types);
   while ($fila = mysqli_fetch_row($resultados)) {
   ?>
                <tr>
                    <form method="post" action="modificarProducto.php">
                        <td><?php echo $fila[0];?></td>
                        <td><input type="text" name="descripcion" value="<?php echo $fila[1];?>"></td>
                        <td><input type="text" name="precio" value="<?php echo $fila[2];?>"></td>
                        <td><input type="text" name="existencias" value="<?php echo $fila[3];?>"></td>
                        <td><input type="text" name="imagen" value="<?php echo $fila[4];?>"></td>
                        <td><input type="text" name="tipo" value="<?php echo $fila[5];?>"></td>
                        <td>
                            <input type="hidden" name="producto_id" value="<?php echo $fila[0]; ?>">
                            <button type="submit" name="modCambios" class="btn btn-warning" onclick="alert('Se ha modificado el producto correctamente.')">Confirmar cambios</button>
                        </td>
                    </form>
                </tr>
                <?php
   }
   ?>
            </tbody>
        </table>

       
        <h2>Insertar Nuevo Producto</h2>
        <form method="post" action="insertarProducto.php">
            <table>
                <tr>
                    <td><label for="descripcion">Descripción:</label></td>
                    <td><input type="text" name="descripcion" required>
                    </td>
                </tr>
                <tr>
                    <td><label for="precio">Precio:</label></td>
                    <td><input type="text" name="precio" required></td>

                </tr>
                <tr>
                    <td><label for="existencias">Existencias:</label></td>
                    <td><input type="text" name="existencias" required></td>
                </tr>
                <tr>
                    <td><label for="imagen">Ruta imagen:</label></td>
                    <td><input type="text" name="imagen" required></td>
                </tr>
                <tr>
                    <td><label for="tipo">Tipo:</label></td>
                    <td><input type="text" name="tipo" required></td>
                </tr>
                <tr>
                    <td><button type="submit" name="addProducto" class="btn btn-warning">Agregar Producto</button></td>
                </tr>
                
            </table>
        </form>
    </div>
    <mi-pie></mi-pie>
    <style>
    .form-inline .form-control {
        width: auto;
    }
</style>
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