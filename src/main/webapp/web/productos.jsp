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
    <link rel="stylesheet" type="text/css" href="./css/styleProductos.css">
  </head>

  <body>
    <mi-menu></mi-menu>
    <div class="container">
      <div class="row">
        <% AccesoBD con=AccesoBD.getInstance(); List<ProductoBD> productos = con.obtenerProductosBD();

          
          for (ProductoBD producto : productos) {
          int codigo=producto.getCodigo();
          String descripcion=producto.getDescripcion();
          float precio=producto.getPrecio();
          int existencias=producto.getStock();
          String imagen=producto.getImagen();
          String tipo = producto.getTipo();
          int cantidad = producto.getCantidad();
          %>
          <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 mt-4">
            <img src="<%= imagen %>" width="150" height="150" alt="<%= descripcion %>"
              class="img-thumbnail"><br>
            <label>
              <%= tipo %><br>
                <%= descripcion %><br>
                  <%= precio %>€
            </label><br>
            <input type="number" class="col-auto" min="1" max="9" value="1" name="cant" id="<%= codigo %>">
            <% if(existencias > 0){%>
            <button type="button" class="btn btn-warning btn-xs" id="carr-<%= codigo %>" onclick="addCarrito({ codigo: <%= codigo %>, descripcion: '<%= descripcion %>', imagen: '<%= imagen %>', precio: <%= precio %>, tipo: '<%= tipo %>', cantidad: <%= cantidad %> , existencias: <%= existencias %>})">
              <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#FFC210" class="bi bi-cart2"
                viewBox="0 0 16 16">
                <path
                  d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5M3.14 5l1.25 5h8.22l1.25-5zM5 13a1 1 0 1 0 0 2 1 1 0 0 0 0-2m-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0m9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2m-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0" />
              </svg>
            </button>
            <%
              }else{
            %>
            <button type="button" class="btn btn-warning btn-xs" id="carr-<%= codigo %>" disabled onclick="addCarrito({ codigo: <%= codigo %>, descripcion: '<%= descripcion %>', imagen: '<%= imagen %>', precio: <%= precio %>, tipo: '<%= tipo %>', cantidad: <%= cantidad %> , existencias: <%= existencias %>})">
              <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="red" class="bi bi-cart2"
                viewBox="0 0 16 16">
                <path
                  d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5M3.14 5l1.25 5h8.22l1.25-5zM5 13a1 1 0 1 0 0 2 1 1 0 0 0 0-2m-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0m9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2m-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0" />
              </svg>
            </button>
            <% } %>
          </div>
          <% } %>
      </div>
    </div>



    <mi-pie></mi-pie>

    <script src="./js/carrito.js"></script>
    <script src="./js/events.js"></script>
    <script src="./js/mis-etiquetas.js"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
      crossorigin="anonymous"></script>
  </body>

  </html>