<!DOCTYPE html>
<html lang="en">

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
        <h2>Lista de pedidos</h2>
        <form class="col-sm-2 form-inline" method="post" action="pedidos.php">
            <label for="fecha">Fecha Pedido:</label><input type="text" name="fecha" class="form-control">
            <label for="codigo">Codigo Producto:</label><input type="text" name="codigo" class="form-control">
            <label for="codigo">Codigo Usuario:</label><input type="text" name="usuario" class="form-control">
            <button type="submit" class="btn btn-warning">Filtrar</button>
        </form>
        <table>
            <thead>
                <tr>
                    <th>ID Pedido</th>
                    <th>ID Cliente</th>
                    <th>Fecha</th>
                    <th>Total</th>
                    <th>Estado</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
            <?php
            if (isset($_POST['fecha']) && !empty($_POST['fecha'])) {
                $resultados = filtrarFecha($_POST['fecha']);
            } else {
                if (isset($_POST['codigo']) && !empty($_POST['codigo'])) {
                    $resultados = filtrarPedidosPorProducto($_POST['codigo']);
                } else{
                    if(isset($_POST['usuario']) && !empty($_POST['usuario'])){
                    $resultados = filtrarPedidosPorUsuario($_POST['usuario']);
                    }else{
                        $resultados = obtenerPedidos();
                    }
                }
            }
   
   while ($fila = mysqli_fetch_row($resultados)) {
   ?>
                    <tr>
                        <td><?php echo $fila[0];?></td>
                        <td><?php echo $fila[1];?></td>
                        <td><?php echo $fila[2];?></td>
                        <td><?php echo $fila[3];?></td>
                        <td><?php echo devolverEstado($fila[4]);?></td>
                        <td>
                            <button class="btn btn-info" data-toggle="modal" data-target="#modalProductos<?php echo $fila[0]; ?>" >Ver Detalles</button>
                            <?php
                                if($fila[4] == 4){
                            ?>
                            <form method="post" action="borrarPedidoCancelado.php" style="display: inline;">
                                <input type="hidden" name="codigo_pedido" value="<?php echo $fila[0]; ?>">
                                <button class="btn btn-danger" name="elim">Eliminar</button>
                            </form>
                            <?php
                                }else{
                            ?>
                            <button class="btn btn-danger" disabled>Eliminar</button>
                            <?php
                                }
                            ?>
                            <form method="post" action="modificarEstado.php" class="inline-form">
                                <input type="hidden" name="pedido_id" value="<?php echo $fila[0]; ?>">
                                <button type="submit" name="estado" value="1" class="btn btn-warning">Pendiente</button>
                                <button type="submit" name="estado" value="2" class="btn btn-primary">Enviado</button>
                                <button type="submit" name="estado" value="3" class="btn btn-success">Entregado</button>
                                <button type="submit" name="estado" value="4" class="btn btn-secondary">Cancelado</button>
                            </form>
                        </td>
                    </tr>
                    <?php
   }
   ?>
            </tbody>
        </table>

    </div>

    <?php
    mysqli_data_seek($resultados, 0);
    while ($fila = mysqli_fetch_row($resultados)) {
        $detallesProductos = obtenerDetallesProductos($fila[0]);
   ?>
                <div class="modal fade" id="modalProductos<?php echo $fila[0];?>" tabindex="-1" role="dialog"
                    aria-labelledby="modalProductos<?php echo $fila[0];?>" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="modalProductosLabel">Lista de Productos</h5>
                                <button type="button" class="close" data-dismiss="modal" id="cerrarcoso" aria-label="Close">X
                                    <span aria-hidden="true"></span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Descripción</th>
                                            <th>Precio</th>
                                            <th>Tipo</th>
                                            <th>Cantidad</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <?php foreach($detallesProductos as $detalle){?>
                                        <tr>
                                            <td><?php echo $detalle[0]; ?></td>
                                            <td><?php echo obtenerDescripcionProducto($detalle[0]); ?></td>
                                            <td><?php echo $detalle[2]; ?></td>
                                            <td><?php echo $detalle[3]; ?></td>
                                            <td><?php echo $detalle[1]; ?></td>
                                        </tr>
                                        <?php }?>
                                    </tbody>
                                </table>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Atrás</button>
                            </div>
                        </div>
                    </div>
                </div>
                <?php
  
                                        }
  ?>
    <mi-pie></mi-pie>
    <?php 
} else {
  header('Location: ../indexAdmin.php');
}
?>
<style>
.inline-form {
    display: inline-block;
    margin: 0;
}
.inline-form button {
    margin: 0 5px;
}
</style>
    <script src="./js/events.js"></script>
    <script src="./js/mis-etiquetas.js"></script>
    <script src="./js/carrito.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script
        src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script
        src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>

</html>