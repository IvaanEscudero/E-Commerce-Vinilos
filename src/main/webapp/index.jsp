<%@ page language="java" contentType="text/html; charset=UTF-8" import="tienda.*" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Iniciar Sesión - Tienda</title>
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
    <%-- Utilizamos una variable en la sesión para informar de los mensajes de Error --%>
	<%
	String mensaje = (String)session.getAttribute("mensaje");

	if (mensaje != null) {
	%>
	<%-- Eliminamos el mensaje consumido --%>
	<%
		session.removeAttribute("mensaje");
	%>
	
	<%
	}
	%>

	<%-- Si no hay usuario o el usuario no es válido --%>

	<%
	if ((session.getAttribute("usuario") == null) ||
	    ((Integer)session.getAttribute("usuario") <=0 ))
	{
	%>
	<%-- Mostramos el formulario para la introducción del usuario y la clave --%>
    <div class="container">
        <div class="d-flex justify-content-center align-items-center h-100">
            <div class="card">
                <div class="card-header">
                    <h4 class="text-left">Iniciar Sesión</h4>
                    <div class="d-flex justify-content-end social_icon">
                        <span><i class="fab fa-youtube-square"></i></span>
                        <span><i class="fab fa-instagram-square"></i></span>
                        <span><i class="fab fa-twitter-square"></i></span>
                    </div>
                </div>
                <div class="card-body">
                    <form method="post" action="login.html">
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
                            <input type="hidden" name="url" value="./index.jsp">
                            <input type="submit" value="Iniciar Sesión" class="btn float-left login_btn">
                            <input type="button" value="Registrarse" class="btn float-right login_btn" onclick="window.location.href = './register.jsp'">
                            <%
	                            if (mensaje != null) {
	                        %>
                                <br><br><p style="color: red"><%= mensaje%></p>
                            <%
	                        }
	                        %>
                        </div>
                    </form>
                </div>
                <%
	} else {
	%>
		<%-- Si existe un usuario, se muestran las opciones del apartado del usuario --%>
        <script>
            window.location.href = "./web/tienda.jsp";
        </script>
		
	<%
	}
	%>
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