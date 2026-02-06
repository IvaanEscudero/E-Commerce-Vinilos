<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,tienda.*" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="es">

    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Usuario - Tienda</title>
        <link rel="icon" type="image/ico" href="./img/as.png">

        <!-- Bootstrap 5 CDN-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

        <!-- CSS Estilo Main Page-->
        <link rel="stylesheet" type="text/css" href="./css/styleUsuario.css">

    </head>

    <body>
        <mi-menu></mi-menu>

        <% if ((session.getAttribute("usuario") !=null)) { AccesoBD con=AccesoBD.getInstance(); int
            codigoUser=(int)session.getAttribute("usuario"); UsuarioBD user=con.DatosUsuario(codigoUser); String
            mensaje=(String)session.getAttribute("mensaje"); if (mensaje !=null) { session.removeAttribute("mensaje"); }
            %>

            <%
            String error = (String)session.getAttribute("error");
        
            if (error != null) {
            %>
            <%-- Eliminamos el mensaje consumido --%>
            <%
                session.removeAttribute("error");
            %>
            
            <%
            }
            %>
            <table class="container row">
                <form method="post" action="../CambiarContra.html">
                    <tr>
                        <td><label>Usuario:</label></td>
                        <td><input type="text" name="usu" value="<%= user.getUsuario()%>" disabled></td>
                    </tr>
                    <tr>
                        <td><label>Clave:</label></td>
                        <td><input type="text" name="clave" placeholder="Edita para cambiar contraseña"></td>
                    </tr>
                    <tr>
                        <td><label>Confirmar Clave:</label></td>
                        <td><input type="text" name="clave2" placeholder="Edita para cambiar contraseña"></td>
                    </tr>
                    <tr>
                        <td><label>Nombre:</label></td>
                        <td><input type="text" name="nom" value="<%= user.getNombre()%>"></td>
                    </tr>
                    <tr>
                        <td><label>Apellidos:</label></td>
                        <td><input type="text" name="ape" value="<%= user.getApellidos()%>"></td>
                    </tr>
                    <tr>
                        <td><label>Domicilo:</label></td>
                        <td><input type="text" name="dom" value="<%= user.getDomicilio()%>"></td>
                    </tr>
                    <tr>
                        <td><label>Poblacion:</label></td>
                        <td><input type="text" name="pob" value="<%= user.getPoblacion()%>"></td>
                    </tr>
                    <tr>
                        <td><label ">Provincia:</label></td>
                    <td><input type=" text" name="prov" value="<%= user.getProvincia()%>"></td>
                    </tr>
                    <tr>
                        <td><label>CP:</label></td>
                        <td><input type="text" name="cp" value="<%= user.getCp()%>"></td>
                    </tr>
                    <tr>
                        <td><label>Telefono:</label></td>
                        <td><input type="text" name="tel" value="<%= user.getTelefono()%>"></td>
                    </tr>
                    <tr>
                        <td><button type="submit" class="btn btn-primary" id="btnModificarDatos">Modificar
                                Datos</button>
                        </td>
                </form>
                <% 
                            if(error!=null){%>
                                <a style="color: red;"><%=error%></a>
                            <%}%>
                <form method="post" action="../logout.html">
                    <td><button type="submit" id="btnLogout" class="btn btn-primary" onclick="">Cerrar Sesión</button>
                    </td>
                </form>
                </tr>

            </table>
            <div class="container col">
                <h2>Lista de Pedidos</h2>
                <table id="pedidoTable">
                    <thead>
                        <tr>
                            <th>ID Pedido</th>
                            <th>Fecha</th>
                            <th>Importe</th>
                            <th>Estado</th>
                            <th>Detalles</th>
                            <th>Cancelar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% ArrayList<PedidoBD> pedidos = con.DevolverPedidoUsuario(codigoUser);

                            if(pedidos != null){
                            for(PedidoBD ped : pedidos){
                            String estado = con.DevolverEstado(ped.getEstado());
                            %>

                            <tr>
                                <td>
                                    <%= ped.getCodigoPedido() %>
                                </td>
                                <td>
                                    <%= ped.getFecha() %>
                                </td>
                                <td>
                                    <%= ped.getImporte() %>€
                                </td>
                                <td>
                                    <%= estado %>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-primary" data-toggle="modal"
                                        data-target="#modalProductos<%= ped.getCodigoPedido()%>">Detalles</button>
                                </td>
                                <td>
                                    <%
                                    System.out.println(ped.getEstado());
                                    if(ped.getEstado()==1){%>
                                        <form method="post" action="../CambiarEstado.html">
                                        <button type="submit" name="cosoeste" value="<%= ped.getCodigoPedido()%>" class="btn btn-primary">Cancelar</button>
                                    </form>
                                    <%}else{%>
                                        <button class="btn btn-primary" onclick="" disabled>Cancelar</button>
                                    <%}%>
                                </td>
                            </tr>

                            <%}%>
                    </tbody>
                </table>
            </div>
            <%for(PedidoBD ped : pedidos){ 
                ArrayList<Producto> prods = con.DevolverProductosDePedido(ped.getCodigoPedido());
                %>
                <div class="modal fade" id="modalProductos<%= ped.getCodigoPedido()%>" tabindex="-1" role="dialog"
                    aria-labelledby="modalProductos<%= ped.getCodigoPedido()%>" aria-hidden="true">
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
                                            <th>Descripción</th>
                                            <th>Precio</th>
                                            <th>Tipo</th>
                                            <th>Cantidad</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%for(Producto prod : prods){%>
                                        <tr>
                                            <td><%=prod.getDescripcion()%></td>
                                            <td><%=prod.getPrecio()%></td>
                                            <td><%=prod.getTipo()%></td>
                                            <td><%=prod.getCantidad()%></td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <%}%>
                    <%}%>



                        <% } else { %>

                            <script>
                                window.location.href = "../index.jsp";
                            </script>

                            <% } %>
                                <mi-pie></mi-pie>
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
                                <!--<script src="./js/events.js"></script>-->
    </body>

    </html>