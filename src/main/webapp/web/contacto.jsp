<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,tienda.*" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contacto - Tienda</title>
    <link rel="icon" type="image/ico" href="./img/as.png">

    <!-- Bootstrap 5 CDN-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    <!-- CSS Estilo Main Page-->
    <link rel="stylesheet" type="text/css" href="./css/styleContacto.css">

</head>

<body>
    <mi-menu></mi-menu>

    <section class="container my-5">
        <div class="row">
            <h2>Información de Contacto</h2>

            <ul>
                <li><strong>Dirección:</strong> Ciutat Vella, Valencia</li>
                <li><strong>Horario de apertura:</strong> Lunes a Viernes: 9:00 - 14:00 y 17:00 - 20:00 </li>
                <li><strong>Horario de Atención al Cliente:</strong> Lunes a Viernes: 9:00 - 14:00</li>
                <li><strong>Teléfono:</strong> +34 674 23 98 45</li>
                <li><strong>Email:</strong> AlegriaSonora@gmail.com</li>

            </ul>
            <div class="col-lg-15">
            <h2>Mapa de Ubicación</h2>
            <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d769.9981640548436!2d-0.3796861835462968!3d39.46949461541196!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd604f495b5cc97f%3A0xa7a06a87a55822b3!2sDiscos%20Oldies!5e0!3m2!1ses!2ses!4v1709838423010!5m2!1ses!2ses"
                allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
            <div class="my-5">
                <h2>Redes Sociales</h2>
                <ul>
                    <li><a href="https://www.facebook.com/tuempresamusical" target="_blank">Facebook</a></li>
                    <li><a href="https://www.twitter.com/tuempresamusical" target="_blank">Twitter</a></li>
                    <li><a href="https://www.instagram.com/tuempresamusical" target="_blank">Instagram</a></li>
                </ul>
            </div>

            <h2>Formulario de Contacto</h2>
            <form method="post" action="../EnviarMensaje.html">
                <table>
                    <tr>
                        <td><label for="nombre">Nombre:</label></td>
                        <td><input type="text" name="nombre" placeholder="Introduce tu nombre..">
                        </td>
                    </tr>
                    <tr>

                        <td><label for="email">Email:</label></td>
                        <td><input type="email" name="email" placeholder="Introduce tu email...">
                        </td>
                    </tr>
                    <tr>
                        <td><label for="mensaje">Mensaje:</label></td>
                        <td><textarea name="mensaje" placeholder="Introduce tu mensaje."
                                required></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Enviar"></td>
                        <td><input type="reset" value="Eliminar"></td>
                    </tr>
                </table>
            </form>
        </div>
    </section>


    <mi-pie></mi-pie>

    <script src="./js/events.js"></script>
    <script src="./js/mis-etiquetas.js"></script>
    <script src="./js/carrito.js"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
    <!--<script src="./js/events.js"></script>-->
</body>

</html>