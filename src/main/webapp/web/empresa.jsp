<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,tienda.*" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Empresa - Tienda</title>
    <link rel="icon" type="image/ico" href="./img/as.png">

    <!-- Bootstrap 5 CDN-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    <!-- CSS Estilo Empresa-->
    <link rel="stylesheet" type="text/css" href="./css/styleEmpresa.css">
</head>

<body>
    <mi-menu></mi-menu>


    <div class="container col">
        <nav>
            <ul>
                <li><a href="#historia">Historia</a></li>
                <li><a href="#actividad">Actividad Detallada</a></li>
                <li><a href="#calidad">Controles de Calidad</a></li>
                <li><a href="#organización">Organización</a></li>
                <li><a href="#compromiso">Compromiso con la Comunidad</a></li>
            </ul>
        </nav>

        <section id="historia">
            <h2>Historia de Alegría Sonora:</h2>
            <p>Desde sus inicios, "Alegría Sonora" ha sido una firma comprometida con la experiencia auditiva auténtica
                y la
                pasión por la música en formatos clásicos. Fundada en 1979, nuestra empresa nació del
                entusiasmo compartido de un grupo de melómanos y coleccionistas de vinilos. Guiados por el deseo de
                ofrecer
                a otros la oportunidad de sumergirse en el sonido analógico, "Alegría Sonora" se ha establecido como un
                referente en la industria musical.</p>
        </section>
        <section id="actividad">
            <h2>Actividad Detallada</h2>
            <p>
                En el corazón de nuestra actividad se encuentra una colección extensa y cuidadosamente seleccionada de
                vinilos, CDs y otros formatos musicales. Trabajamos incansablemente para asegurar que cada producto que
                ofrecemos sea una joya musical, desde clásicos inmortales hasta rarezas difíciles de encontrar.
                <br>
                Nos enorgullece ser una plataforma donde los amantes de la música pueden descubrir tesoros perdidos y
                disfrutar de una amplia variedad de géneros. Además de la venta de productos, organizamos eventos y
                sesiones
                de escucha para crear una comunidad vibrante de entusiastas musicales.
            </p>
        </section>
        <table>
            <tr>
                <td id="calidad">
                    <h2>Controles de Calidad:</h2>
                    <p>En "Alegría Sonora", la calidad es nuestra máxima prioridad. Cada vinilo, CD o cassette pasa por
                        rigurosos controles de calidad antes de llegar a nuestras estanterías. Nos asociamos con
                        proveedores
                        de confianza y expertos en restauración para garantizar que cada producto cumpla con nuestros
                        estándares exigentes. Desde la condición física hasta la fidelidad del sonido, cada detalle es
                        evaluado para ofrecer a nuestros clientes solo lo mejor.</p>
                </td>
                <td id="organización">
                    <h2>Organización:</h2>
                    <p>Nuestra organización se basa en la pasión y el compromiso compartidos por cada miembro del
                        equipo.
                        Desde el equipo de adquisiciones que busca incansablemente nuevas adiciones a nuestra colección
                        hasta el personal en nuestras tiendas que comparte conocimientos y recomendaciones, todos
                        contribuimos a la misión de "Alegría Sonora". Además, fomentamos un ambiente inclusivo que
                        valora la
                        diversidad de gustos musicales y experiencias.</p>
                </td>
            </tr>
        </table>
        <section id="compromiso">
            <h2>Compromiso con la Comunidad</h2>
            <p>
                "Alegría Sonora" va más allá de la venta de productos. Nos comprometemos activamente con la comunidad
                musical local a través de eventos, colaboraciones con artistas emergentes y programas educativos.
                Creemos en
                devolver a la comunidad que nos ha apoyado y en enriquecer la experiencia musical para todos.

                Con cada acorde, "Alegría Sonora" continúa su viaje, llevando la pasión por la música a nuevas alturas y
                compartiendo la magia de los formatos clásicos con generaciones presentes y futuras. La historia de
                nuestra
                empresa está entrelazada con la vibrante historia de la música, y esperamos seguir siendo un faro para
                aquellos que buscan explorar y celebrar la riqueza sonora del pasado y del presente. </p>
        </section>
    </div>
    <mi-pie></mi-pie>
    <script src="./js/events.js"></script>
    <script src="./js/mis-etiquetas.js"></script>
    <script src="./js/carrito.js"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>

</html>