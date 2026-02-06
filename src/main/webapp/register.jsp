<%@ page language="java" contentType="text/html; charset=UTF-8" import="tienda.*" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Registrarse - Tienda</title>
    <link rel="icon" type="image/ico" href="./web/img/as.png" >
    <!--Bootstrap 4 CDN-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <!--Font awesome CDN-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
        integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous">

    <!--CSS Estilo-->
    <link rel="stylesheet" type="text/css" href="./web/css/styleregister.css">
</head>

<body>
    <%
        AccesoBD con=AccesoBD.getInstance();

    %>
    <%
	String mensaje = (String)session.getAttribute("error");

	if (mensaje != null) {
	%>
	<%-- Eliminamos el mensaje consumido --%>
	<%
		session.removeAttribute("error");
	%>
	
	<%
	}
	%>
    <div class="container">
        <div class="d-flex justify-content-center align-items-center h-60">
            <div class="card">
                <div class="card-header">
                    <h4 class="text-left">Registrarse</h4>
                    <div class="d-flex justify-content-end social_icon">
                        <span><i class="fab fa-youtube-square"></i></span>
                        <span><i class="fab fa-instagram-square"></i></span>
                        <span><i class="fab fa-twitter-square"></i></span>
                    </div>
                </div>
                <div class="card-body">
                    <form  id="regUser" method="post" action="register.html">
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"></i></span>
                            </div>
                            <input type="text" class="form-control" name="usuario" placeholder="Usuario" required>
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"></i></span>
                            </div>
                            <input type="password" class="form-control" name="clave" placeholder="Contraseña" required>
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"></i></span>
                            </div>
                            <input type="password" class="form-control" name="clave2" placeholder="Confirmar Contraseña" required>
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"></i></span>
                            </div>
                            <input type="text" class="form-control" name="nombre" placeholder="Nombre" required>
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"></i></span>
                            </div>
                            <input type="text" class="form-control" name="apellidos" placeholder="Apellidos" required>
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"></i></span>
                            </div>
                            <input type="text" class="form-control" name="domicilio" placeholder="Domicilo" required>
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"></i></span>
                            </div>
                            <input type="text" class="form-control" name="poblacion" placeholder="Poblacion" required>
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"></i></span>
                            </div>
                            <input type="text" class="form-control" name="provincia" placeholder="Provincia" required>
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"></i></span>
                            </div>
                            <input type="number" class="form-control" name="cp" max="99999" placeholder="CP">
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"></i></span>
                            </div>
                            <input type="number" class="form-control" name="telefono" placeholder="Telefono" max="999999999" required>
                        </div>
                        <div class="form-group mt-5">
                            <input type="submit" value="Aceptar" class="btn float-left login_btn">
                            <input type="button" value="Cancelar" class="btn float-right login_btn" onclick="window.location.href = './index.jsp'">
                            <% 
                            if(mensaje!=null){%>
                                <a style="color: red;"><%=mensaje%></a>
                            <%}%>
                        </div>
                    </form>
                    
                </div>
            </div>
        </div>
    </div>
    
    <script src="./web/js/events.js"></script>
    <script src="./web/js/mis-etiquetas.js"></script>
    <script src="./web/js/carrito.js"></script>
</body>

</html>