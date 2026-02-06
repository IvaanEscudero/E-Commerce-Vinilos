<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,tienda.*" pageEncoding="UTF-8" %>

    <!DOCTYPE html>
    <html lang="es">

    <head>
        <title>Resguardo - Tienda</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/ico" href="./img/as.png">
        <!-- Bootstrap 5 CDN-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">


        <!--CSS Estilo-->
        <link rel="stylesheet" type="text/css" href="./css/styleResguardo.css">
    </head>

    <body>
        <mi-menu></mi-menu>
        <% if ((session.getAttribute("usuario") !=null)) { 
            AccesoBD con=AccesoBD.getInstance(); int
            codigo=(int)session.getAttribute("usuario"); UsuarioBD user=con.DatosUsuario(codigo); ArrayList<Producto>
            carrito = new ArrayList<Producto>();
                carrito = (ArrayList<Producto>)session.getAttribute("carritoJSON");
                    float acum =0;
                    %>
                    <div class="container col">
                        <h2>Lista de Productos</h2>
                        <table id="productTable">
                            <thead>
                                <tr>
                                    <th>Descripción</th>
                                    <th>Precio</th>
                                    <th>Unidades</th>
                                    <th>Tipo</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for(Producto prod : carrito){ float cantFloat=prod.getCantidad(); %>
                                    <tr>
                                        <td>
                                            <%= prod.getDescripcion()%>
                                        </td>
                                        <td>
                                            <%= prod.getPrecio()%>
                                        </td>
                                        <td>
                                            <%= prod.getCantidad()%>
                                                <%acum=acum+(cantFloat*(int)prod.getPrecio());%>
                                        </td>
                                        <td>
                                            <%= prod.getTipo()%>
                                        </td>
                                    </tr>
                                    <% } %>
                                        <tr>
                                            <td colspan="4">
                                                <a>Total: <%= acum%>€</a>
                                            </td>
                                        </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="container col">
                        <h2>Datos de envío</h2>
                        <table id="productTable">
                            <tbody>
                                <tr>
                                    <td>
                                        <a><strong>Domicilio:</strong></a>
                                    </td>
                                    <td>
                                        <%=user.getDomicilio() %>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a><strong>Poblacion:</strong></a>
                                    </td>
                                    <td>
                                        <%=user.getPoblacion() %>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a><strong>Provincia:</strong></a>
                                    </td>
                                    <td>
                                        <%=user.getProvincia() %>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a><strong>CP:</strong></a>
                                    </td>
                                    <td>
                                        <%=user.getCp() %>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a><strong>Telefono:</strong></a>
                                    </td>
                                    <td>
                                        <%=user.getTelefono() %>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <% for(Producto prod : carrito){
                        if(prod.getCantidad()>con.DevolverStock(prod.getCodigo())){
                            session.setAttribute("msjErrProducto", "No hay suficiente en stock con " + prod.getDescripcion());}
                    }%>
                    <div id="butdiv" class="container text-center">
                        <button type="button" id="" class="btn btn-primary" onclick="window.location.href='./productos.jsp'">Cancelar</button>
                        <%if((session.getAttribute("msjErrProducto") == null)){%>
                            <form method="post" action="../RegisterPedido.html">
                                <input type="hidden" name="importe" value="<%= acum%>">
                                <button type="submit" id="" class="btn btn-primary" onclick="">Comprar</button></td>
                            </form>
                        <%} else{%>
                                <button type="submit" class="btn btn-primary" disabled>Comprar</button></td>
                                <a><%=session.getAttribute("msjErrProducto")%></a></td>
                            
                        <%}%>
                    </div>
                    <% } else{ %>
                        <script>
                            window.location.href = "../index.jsp";
                        </script>
                        <% } session.removeAttribute("msjErrProducto");%>
                            <mi-pie></mi-pie>
                            <script src="./js/events.js"></script>
                            <script src="./js/mis-etiquetas.js"></script>
                            <script src="./js/carrito.js"></script>

                            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
                                crossorigin="anonymous"></script>
    </body>

    </html>