<?php

function conectar() {
   $bbdd = mysqli_connect("localhost","root","root","daw");
   if (mysqli_connect_error()) {
      printf("Error conectando a la base de datos: %s\n",mysqli_connect_error());
      exit();
   }
   return $bbdd;
}

function desconectar($bbdd) {
   mysqli_close($bbdd);
}

function obtenerProductos() {
   $bbdd = conectar();
   if($bbdd){
    $consulta = "SELECT * FROM productos";
    $resultado = mysqli_query($bbdd,$consulta);
    
    return $resultado;
   }
   else{
    echo "error obtenerProductos";
   }
   desconectar($bbdd);
   
}

function obtenerUsuarios() {
    $bbdd = conectar();
    if($bbdd){
        $consulta = "SELECT * FROM usuarios";
        $resultado = mysqli_query($bbdd,$consulta);
        
        return $resultado;
    }else{
        echo "error obtenerUsuarios";
       }
       desconectar($bbdd);
 }

function obtenerPedidos() {
    $bbdd = conectar();
    if($bbdd){
        $consulta = "SELECT * FROM pedidos";
        $resultado = mysqli_query($bbdd,$consulta);
        
        return $resultado;
    }else{
        echo "error obtenerPedidos";
       }
       desconectar($bbdd);
}

function validarUsuario($usuario, $clave) {
    $bbdd = conectar();
    $codigo = -1;
    $resultado = false;

    if($bbdd){
        if($consulta = mysqli_prepare($bbdd,"SELECT codigo FROM usuarios WHERE usuario=? AND clave=?")){
            mysqli_stmt_bind_param($consulta,"ss",$usuario,$clave);
            if(mysqli_stmt_execute($consulta)){
                $resultado = mysqli_stmt_get_result($consulta);
                if($fila = mysqli_fetch_row($resultado)){
                    $codigo = $fila[0];
                }

            }
        }
    }
    else{
        echo "error validarUsuario";
    }
    
    
    desconectar($bbdd);
    return $codigo;
}

function esAdmin($codigo) {
    $bbdd = conectar();
    $ok = false;
    if($bbdd){
        if($consulta = mysqli_prepare($bbdd,"SELECT admin FROM usuarios WHERE codigo=?")){
            mysqli_stmt_bind_param($consulta,"i",$codigo);
            if(mysqli_stmt_execute($consulta)){
                $resultado = mysqli_stmt_get_result($consulta);
                if($fila = mysqli_fetch_row($resultado)){
                    if($fila[0]==1){
                        $ok = true;
                    }
                }

            }
        }
    }
    else{
        echo "error esAdmin";
    }
    
    
    desconectar($bbdd);
    return $ok;
}

function activarDesactivarUsuario($codigo) {
    $bbdd = conectar();
    if ($bbdd) {
        if ($consulta = mysqli_prepare($bbdd, "SELECT activo FROM usuarios WHERE codigo = ?")) {
            mysqli_stmt_bind_param($consulta, "i", $codigo);
            if (mysqli_stmt_execute($consulta)) {
                $resultado = mysqli_stmt_get_result($consulta);
                if ($fila = mysqli_fetch_row($resultado)) {
                    $nuevo_estado = ($fila[0] == 1) ? 0 : 1;

                    if ($update = mysqli_prepare($bbdd, "UPDATE usuarios SET activo = ? WHERE codigo = ?")) {
                        mysqli_stmt_bind_param($update, "ii", $nuevo_estado, $codigo);
                        if (mysqli_stmt_execute($update)) {
                            echo "Estado del usuario actualizado exitosamente.";
                        } else {
                            echo "Error al ejecutar la actualización: " . mysqli_error($bbdd);
                        }
                        mysqli_stmt_close($update);
                    } else {
                        echo "Error al preparar la actualización: " . mysqli_error($bbdd);
                    }
                } else {
                    echo "Usuario no encontrado.";
                }
                mysqli_stmt_close($consulta);
            } else {
                echo "Error al ejecutar la consulta: " . mysqli_error($bbdd);
            }
        } else {
            echo "Error al preparar la consulta: " . mysqli_error($bbdd);
        }
        
    } else {
        echo "Error al conectar a la base de datos.";
    }
    desconectar($bbdd);
}

function modificarProductos($codigo,$descripcion,$precio,$existencias,$imagen,$tipo) {
    $bbdd = conectar();
    if($bbdd){
        if($consulta = mysqli_prepare($bbdd,"UPDATE productos SET descripcion=?,precio=?,existencias=?,imagen=?,tipo=? WHERE codigo=?")){
            mysqli_stmt_bind_param($consulta,"sdissi",$descripcion,$precio,$existencias,$imagen,$tipo,$codigo);
            if(mysqli_stmt_execute($consulta)){
                echo "Producto actualizado exitosamente.";
            } else {
                echo "Error al ejecutar la actualización: " . mysqli_error($bbdd);
            }
        }else {
            echo "Error al preparar la consulta: " . mysqli_error($bbdd);
        }
    }else {
        echo "Error al conectar a la base de datos.";
    }
    
    
    desconectar($bbdd);
}
function insertarProducto($descripcion,$precio,$existencias,$imagen,$tipo){
    $bbdd = conectar();
    if($bbdd){
        if($consulta = mysqli_prepare($bbdd,"INSERT INTO productos (descripcion, precio, existencias, imagen, tipo) VALUES (?, ?, ?, ?, ?)")){
            mysqli_stmt_bind_param($consulta,"sdiss",$descripcion,$precio,$existencias,$imagen,$tipo);
            if(mysqli_stmt_execute($consulta)){
                echo "Producto insertardo exitosamente.";
            } else {
                echo "Error al ejecutar la inserción: " . mysqli_error($bbdd);
            }
        }else {
            echo "Error al preparar la consulta: " . mysqli_error($bbdd);
        }
    }else {
        echo "Error al conectar a la base de datos.";
    }
    
    
    desconectar($bbdd);
}

function devolverEstado($codigo){
    $bbdd = conectar();
    $estado = "";
    if($bbdd){
        if($consulta = mysqli_prepare($bbdd,"SELECT descripcion FROM estados WHERE codigo=?")){
            mysqli_stmt_bind_param($consulta,"i",$codigo);
            if(mysqli_stmt_execute($consulta)){
                $resultado = mysqli_stmt_get_result($consulta);
                if($fila = mysqli_fetch_row($resultado)){
                    $estado = $fila[0];
                } else {
                    echo "No se encontró ningún estado para el código proporcionado.";
                }

            } else {
                echo "Error al ejecutar la consulta: " . mysqli_error($bbdd);
            }
        } else {
            echo "Error al preparar la consulta: " . mysqli_error($bbdd);
        }
    } else {
        echo "Error al conectar a la base de datos.";
    }
    
    
    desconectar($bbdd);
    return $estado;

}

function obtenerDetallesProductos($codigo){
    $bbdd = conectar();
    $detallesProductos = array();
    if($bbdd){
        if($consulta = mysqli_prepare($bbdd,"SELECT codigo_producto, unidades, precio_unitario, tipo FROM detalle WHERE codigo_pedido = ?")){
            mysqli_stmt_bind_param($consulta,"i",$codigo);
            if(mysqli_stmt_execute($consulta)){
                $resultado = mysqli_stmt_get_result($consulta);
                while ($fila = mysqli_fetch_row($resultado)) {
                    $detallesProductos[] = $fila;
                }
            } else {
                echo "Error al ejecutar la consulta: " . mysqli_error($bbdd);
            }
        } else {
            echo "Error al preparar la consulta: " . mysqli_error($bbdd);
        }
    } else {
        echo "Error al conectar a la base de datos.";
    }
    
    
    desconectar($bbdd);
    return $detallesProductos;
}

function obtenerDescripcionProducto($codigo){
    $bbdd = conectar();
    if($bbdd){
        if($consulta = mysqli_prepare($bbdd,"SELECT descripcion FROM productos WHERE codigo = ?")){
            mysqli_stmt_bind_param($consulta,"i",$codigo);
            if(mysqli_stmt_execute($consulta)){
                $resultado = mysqli_stmt_get_result($consulta);
                if($fila = mysqli_fetch_row($resultado)){
                    $descripcion = $fila[0];
                } else {
                    echo "No se encontró ningún descripcion para el código proporcionado.";
                }
            } else {
                echo "Error al ejecutar la consulta: " . mysqli_error($bbdd);
            }
        } else {
            echo "Error al preparar la consulta: " . mysqli_error($bbdd);
        }
    } else {
        echo "Error al conectar a la base de datos.";
    }
    
    
    desconectar($bbdd);
    return $descripcion;
}

function modificarEstadoPedido($codigo,$estado){
    $bbdd = conectar();
    if($bbdd){
        if($consulta = mysqli_prepare($bbdd,"UPDATE pedidos SET estado=? WHERE codigo=?")){
            mysqli_stmt_bind_param($consulta,"ii",$estado,$codigo);
            if(mysqli_stmt_execute($consulta)){
                echo "Pedido actualizado exitosamente.";
            } else {
                echo "Error al ejecutar la actualización: " . mysqli_error($bbdd);
            }
        }else {
            echo "Error al preparar la consulta: " . mysqli_error($bbdd);
        }
    }else {
        echo "Error al conectar a la base de datos.";
    }
    
    
    desconectar($bbdd);
}

function obtenerMensajes(){
    $bbdd = conectar();
    if($bbdd){
        if($consulta = mysqli_prepare($bbdd,"SELECT * FROM mensajes")){
            
            if(mysqli_stmt_execute($consulta)){
                $resultado = mysqli_stmt_get_result($consulta);
                
            } else {
                echo "Error al ejecutar la actualización: " . mysqli_error($bbdd);
            }
        }else {
            echo "Error al preparar la consulta: " . mysqli_error($bbdd);
        }
    }else {
        echo "Error al conectar a la base de datos.";
    }
    
    
    desconectar($bbdd);
    return $resultado;
}
function filtrarFecha($fecha){
    $bbdd = conectar();
    if($bbdd){
        if($consulta = mysqli_prepare($bbdd,"SELECT * FROM pedidos WHERE fecha=?")){
            mysqli_stmt_bind_param($consulta,"s",$fecha);
            if(mysqli_stmt_execute($consulta)){
                $resultado = mysqli_stmt_get_result($consulta);
                
            } else {
                echo "Error al ejecutar la actualización: " . mysqli_error($bbdd);
            }
        }else {
            echo "Error al preparar la consulta: " . mysqli_error($bbdd);
        }
    }else {
        echo "Error al conectar a la base de datos.";
    }
    
    
    desconectar($bbdd);
    return $resultado;
}

function filtrarProductos($query,$params,$types){
    $bbdd = conectar();
    
    if ($bbdd) {
        if ($consulta = mysqli_prepare($bbdd, $query)) {
            if (!empty($params)) {
                mysqli_stmt_bind_param($consulta, $types, ...$params);
            }
            
            if (mysqli_stmt_execute($consulta)) {
                $resultado = mysqli_stmt_get_result($consulta);
            } else {
                echo "Error al ejecutar la consulta: " . mysqli_error($bbdd);
                $resultado = false;
            }
            
            mysqli_stmt_close($consulta);
        } else {
            echo "Error al preparar la consulta: " . mysqli_error($bbdd);
            $resultado = false;
        }
        
        desconectar($bbdd);
    } else {
        echo "Error al conectar a la base de datos.";
        $resultado = false;
    }
    
    return $resultado;
}

function filtrarPedidosPorProducto($codigo_producto){
    $bbdd = conectar();
    if($bbdd){
        if($consulta = mysqli_prepare($bbdd,"SELECT * FROM pedidos WHERE codigo in (SELECT codigo_pedido FROM detalle WHERE codigo_producto = ?)")){
            mysqli_stmt_bind_param($consulta,"i",$codigo_producto);
            if(mysqli_stmt_execute($consulta)){
                $resultado = mysqli_stmt_get_result($consulta);
                
            } else {
                echo "Error al ejecutar la actualización: " . mysqli_error($bbdd);
            }
        }else {
            echo "Error al preparar la consulta: " . mysqli_error($bbdd);
        }
    }else {
        echo "Error al conectar a la base de datos.";
    }
    
    
    desconectar($bbdd);
    return $resultado;
}

function filtrarPedidosPorUsuario($codigo_usuario){
    $bbdd = conectar();
    if($bbdd){
        if($consulta = mysqli_prepare($bbdd,"SELECT * FROM pedidos WHERE persona=?")){
            mysqli_stmt_bind_param($consulta,"i",$codigo_usuario);
            if(mysqli_stmt_execute($consulta)){
                $resultado = mysqli_stmt_get_result($consulta);
                
            } else {
                echo "Error al ejecutar la actualización: " . mysqli_error($bbdd);
            }
        }else {
            echo "Error al preparar la consulta: " . mysqli_error($bbdd);
        }
    }else {
        echo "Error al conectar a la base de datos.";
    }
    
    
    desconectar($bbdd);
    return $resultado;
}

function modificarUsuarios($usuario_id,$nombre,$apellidos,$domicilio,$poblacion,$provincia,$cp, $telefono) {
    $bbdd = conectar();
    if($bbdd){
        if($consulta = mysqli_prepare($bbdd,"UPDATE usuarios SET nombre=?,apellidos=?,domicilio=?,poblacion=?,provincia=?,cp=?,telefono=? WHERE codigo=?")){
            mysqli_stmt_bind_param($consulta,"sssssiii",$nombre,$apellidos,$domicilio,$poblacion,$provincia,$cp, $telefono,$usuario_id);
            if(mysqli_stmt_execute($consulta)){
                echo "Usuario actualizado exitosamente.";
            } else {
                echo "Error al ejecutar la actualización de usuario: " . mysqli_error($bbdd);
            }
        }else {
            echo "Error al preparar la consulta: " . mysqli_error($bbdd);
        }
    }else {
        echo "Error al conectar a la base de datos.";
    }
    
    
    desconectar($bbdd);
}
function borrarEnDetallePedidoCancelado($codigo_pedido){
    $bbdd = conectar();
    if($bbdd){
        if($consulta = mysqli_prepare($bbdd,"DELETE FROM detalle WHERE codigo_pedido = ?")){
            mysqli_stmt_bind_param($consulta,"i",$codigo_pedido);
            if(mysqli_stmt_execute($consulta)){
                echo "exito borrando";
            } else {
                echo "Error al ejecutar el borrado: " . mysqli_error($bbdd);
            }
        }else {
            echo "Error al preparar la consulta: " . mysqli_error($bbdd);
        }
    }else {
        echo "Error al conectar a la base de datos.";
    }
    
    
    desconectar($bbdd);
}
function borrarPedidoCancelado($codigo_pedido){
    borrarEnDetallePedidoCancelado($codigo_pedido);
    $bbdd = conectar();
    if($bbdd){
        if($consulta = mysqli_prepare($bbdd,"DELETE FROM pedidos WHERE codigo = ?")){
            mysqli_stmt_bind_param($consulta,"i",$codigo_pedido);
            if(mysqli_stmt_execute($consulta)){
                echo "exito borrando";
            } else {
                echo "Error al ejecutar el borrado: " . mysqli_error($bbdd);
            }
        }else {
            echo "Error al preparar la consulta: " . mysqli_error($bbdd);
        }
    }else {
        echo "Error al conectar a la base de datos.";
    }
    
    
    desconectar($bbdd);
}
function filtrarUsuarios($query,$params,$types){
    $bbdd = conectar();
    
    if ($bbdd) {
        if ($consulta = mysqli_prepare($bbdd, $query)) {
            if (!empty($params)) {
                mysqli_stmt_bind_param($consulta, $types, ...$params);
            }
            
            if (mysqli_stmt_execute($consulta)) {
                $resultado = mysqli_stmt_get_result($consulta);
            } else {
                echo "Error al ejecutar la consulta: " . mysqli_error($bbdd);
                $resultado = false;
            }
            
            mysqli_stmt_close($consulta);
        } else {
            echo "Error al preparar la consulta: " . mysqli_error($bbdd);
            $resultado = false;
        }
        
        desconectar($bbdd);
    } else {
        echo "Error al conectar a la base de datos.";
        $resultado = false;
    }
    
    return $resultado;
}
function filtrarMensajes($query,$params,$types){
    $bbdd = conectar();
    
    if ($bbdd) {
        if ($consulta = mysqli_prepare($bbdd, $query)) {
            if (!empty($params)) {
                mysqli_stmt_bind_param($consulta, $types, ...$params);
            }
            
            if (mysqli_stmt_execute($consulta)) {
                $resultado = mysqli_stmt_get_result($consulta);
            } else {
                echo "Error al ejecutar la consulta: " . mysqli_error($bbdd);
                $resultado = false;
            }
            
            mysqli_stmt_close($consulta);
        } else {
            echo "Error al preparar la consulta: " . mysqli_error($bbdd);
            $resultado = false;
        }
        
        desconectar($bbdd);
    } else {
        echo "Error al conectar a la base de datos.";
        $resultado = false;
    }
    
    return $resultado;
}
?>