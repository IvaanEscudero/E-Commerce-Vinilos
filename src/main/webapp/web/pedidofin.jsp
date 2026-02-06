<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.List,tienda.*" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html lang="es">

  <head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Productos - Tienda</title>
    <link rel="icon" type="image/ico" href="./img/as.png">

    <!-- Bootstrap 5 CDN-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    <!-- CSS Estilo Main Page-->
    <link rel="stylesheet" type="text/css" href="./css/stylehub.css">
  </head>
  <body>
    <mi-menu></mi-menu>
    <div class="container d-flex row-mb-4">
        <div class="container d-flex justify-content-center">
        <table>
            <tr>
                <td class="titulo">
                    <div>
                        <h1>Bienvenido a Alegría Sonora</h1>
                    </div>
                </td>
                <td class="contenido">
                    
                    <p>Alegría Sonora es una herramienta esencial para los aficionados a la música y coleccionistas de
                        discos en
                        cualquier etapa de su viaje, desde recursos para explorar las discografías de los lanzamientos
                        musicales de los artistas hasta herramientas que te ayudan a organizar y crear tu colección.
                        Tanto si buscas una rareza como un clásico popular o te anticipas a un
                        nuevo lanzamiento, Alegría Sonora reúne a una comunidad global de aficionados a la música y
                        coleccionistas
                        de discos, que se ayudan mutuamente en su particular viaje para profundizar y encontrar y
                        compartir
                        la música que les gusta.
                    
                    </p>
                </td>
            </tr>
            <tr>
                <td>
                    <p>
                        Explora nuestra amplia selección de vinilos, CDs y otros formatos musicales. Desde clásicos
                        atemporales hasta las últimas novedades, cada artículo en nuestra tienda ha sido cuidadosamente
                        seleccionado para ofrecerte lo mejor en calidad y diversidad. Sumérgete en la calidez única del
                        sonido analógico o disfruta de la comodidad digital, ¡tú decides!
                    </p>
                </td>
                <td>
                    <img src="./img/istockphoto-134119615-612x612.jpg" alt="vinilos" width="300" height="300">
                </td>
            </tr>
            <tr>
                <td>
                    <img src="./img/istockphoto-498733257-612x612.jpg" width="400" alt="vinilos" height="300">
                </td>
                <td>
                    <p>
                        En Alegría Sonora, no solo ofrecemos productos, sino también una experiencia musical única.
                        Nuestro conocedor equipo está aquí para asesorarte y compartir sus conocimientos, asegurándose
                        de que encuentres la joya musical que estás buscando. Ya sea que seas un coleccionista ávido, un
                        melómano apasionado o simplemente busques regalar música con un toque vintage, tenemos algo
                        especial para ti.
                    </p>
                </td>
            </tr>
        </table>
    </div>
    </div>
    <div class="modal fade" id="modalCompraExitosa" tabindex="-1" aria-labelledby="modalCompraExitosaLabel"
    aria-hidden="false">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="modalCompraExitosaLabel">¡Compra exitosa!</h5>
        </div>
        <div class="modal-body">
          <p>Gracias por tu compra. Esperamos que disfrutes de tu producto.</p>
        </div>
        <div class="modal-footer">
          <form method="post" action="../VaciarSesionCarrito.html">
          <button type="button" class="btn btn-secondary"  onclick="vaciarCarrito()" data-bs-dismiss="modal" >Cerrar</button>
        </form>
        </div>
      </div>
    </div>
  </div>

    <mi-pie></mi-pie>

    <script src="./js/carrito.js"></script>
    <script src="./js/events.js"></script>
    <script src="./js/mis-etiquetas.js"></script>
    <script>
        // Muestra la ventana modal cuando se carga la página
        window.onload = function() {
          var myModal = new bootstrap.Modal(document.getElementById('modalCompraExitosa'), {
            keyboard: false
          });
          myModal.show();
        };
      </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
      crossorigin="anonymous"></script>
  </body>

  </html>