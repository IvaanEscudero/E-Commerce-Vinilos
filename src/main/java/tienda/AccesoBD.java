package tienda;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.http.HttpSession;

public final class AccesoBD {
    private static AccesoBD instanciaUnica = null;
    private Connection conexionBD = null;

    public static AccesoBD getInstance() {
        if (instanciaUnica == null) {
            instanciaUnica = new AccesoBD();
        }
        return instanciaUnica;
    }

    private AccesoBD() {
        abrirConexionBD();
    }

    public void abrirConexionBD() {
        if (conexionBD == null) {
            String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
            // daw es el nombre de la base de datos que hemos creado con anterioridad.
            String DB_URL = "jdbc:mariadb://localhost:3306/daw";
            // El usuario root y su clave son los que se puso al instalar MariaDB.
            String USER = "root";
            String PASS = "root";
            try {
                Class.forName(JDBC_DRIVER);
                conexionBD = DriverManager.getConnection(DB_URL, USER, PASS);
            } catch (Exception e) {
                System.err.println("No se ha podido conectar a la base de datos");
                System.err.println(e.getMessage());
                e.printStackTrace();
            }
        }
    }

    public boolean comprobarAcceso() {
        abrirConexionBD();
        return (conexionBD != null);
    }

    public List<ProductoBD> obtenerProductosBD() {
        abrirConexionBD();

        ArrayList<ProductoBD> productos = new ArrayList<>();

        try {
            // hay que tener en cuenta las columnas de la tabla de productos
            String con = "SELECT codigo,descripcion,precio,existencias,imagen,tipo,cantidad FROM productos";
            Statement s = conexionBD.createStatement();
            ResultSet resultado = s.executeQuery(con);
            while (resultado.next()) {
                ProductoBD producto = new ProductoBD();
                producto.setCodigo(resultado.getInt("codigo"));
                producto.setDescripcion(resultado.getString("descripcion"));
                producto.setPrecio(resultado.getFloat("precio"));
                producto.setStock(resultado.getInt("existencias"));
                producto.setImagen(resultado.getString("imagen"));
                producto.setTipo(resultado.getString("tipo"));
                producto.setCantidad(resultado.getInt("cantidad"));
                productos.add(producto);
            }
        } catch (Exception e) {
            System.err.println("Error ejecutando la consulta a la base de datos");
            System.err.println(e.getMessage());
        }

        return productos;
    }

    public int comprobarUsuarioBD(String usuario, String clave) {
        abrirConexionBD();

        int codigo = -1;

        try {
            String con = "SELECT codigo FROM usuarios WHERE usuario=? AND clave=?";
            PreparedStatement s = conexionBD.prepareStatement(con);
            s.setString(1, usuario);
            s.setString(2, clave);

            ResultSet resultado = s.executeQuery();

            // El usuario/clave se encuentra en la BD

            if (resultado.next()) {
                codigo = resultado.getInt("codigo");
            }
        } catch (Exception e) {

            // Error en la conexión con la BD
            System.err.println("Error verificando usuario/clave");
            System.err.println(e.getMessage());
            e.printStackTrace();
        }

        return codigo;
    }

    public UsuarioBD DatosUsuario(int codigo) {
        abrirConexionBD();
        UsuarioBD user = new UsuarioBD();

        try {
            // hay que tener en cuenta las columnas de la tabla de productos

            String con = "SELECT * FROM usuarios WHERE codigo=?";
            PreparedStatement s = conexionBD.prepareStatement(con);
            s.setInt(1, codigo);
            ResultSet resultado = s.executeQuery();

            if (resultado.next()) {
                user.setCodigo(resultado.getInt("codigo"));
                user.setActivo(resultado.getInt("activo"));
                user.setAdmin(resultado.getInt("admin"));
                user.setUsuario(resultado.getString("usuario"));
                user.setClave(resultado.getString("clave"));
                user.setNombre(resultado.getString("nombre"));
                user.setApellidos(resultado.getString("apellidos"));
                user.setDomicilio(resultado.getString("domicilio"));
                user.setPoblacion(resultado.getString("poblacion"));
                user.setProvincia(resultado.getString("provincia"));
                user.setCp(resultado.getInt("cp"));
                user.setTelefono(resultado.getInt("telefono"));
            }

        } catch (Exception e) {
            System.err.println("Error ejecutando la consulta a la base de datos");
            System.err.println(e.getMessage());
        }

        return user;
    }

    public Boolean ExisteUsuario(String usu) {
        abrirConexionBD();
        try {

            String con = "SELECT COUNT(*) FROM usuarios WHERE usuario=?";
            PreparedStatement s = conexionBD.prepareStatement(con);
            s.setString(1, usu);
            ResultSet resultado = s.executeQuery();

            if (resultado.next()) {
                return resultado.getInt(1) > 0;

            }

        } catch (Exception e) {
            System.err.println("Error ejecutando la consulta a la base de datos");
            System.err.println(e.getMessage());
        }

        return false;
    }

    public void RegistraUsuario(String usuario, String clave, String nombre, String apellidos, String domicilio,
            String poblacion, String provincia, int cp, int telefono) {
        abrirConexionBD();
        try {
            String con = "INSERT INTO usuarios (usuario, clave, nombre, apellidos, domicilio, poblacion, provincia, cp, telefono,activo,admin) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement s = conexionBD.prepareStatement(con);
            s.setString(1, usuario);
            s.setString(2, clave);
            s.setString(3, nombre);
            s.setString(4, apellidos);
            s.setString(5, domicilio);
            s.setString(6, poblacion);
            s.setString(7, provincia);
            s.setInt(8, cp);
            s.setInt(9, telefono);
            s.setInt(10, 1);
            s.setInt(11, 0);
            s.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error registrando usuario");
            System.err.println(e.getMessage());
        }
    }

    public void ModificarDatosUsuario(int codigo, String clave, String nombre, String apellidos, String domicilio,
            String poblacion, String provincia, String cp, String telefono) {
        abrirConexionBD();
        try {
            String con = "UPDATE usuarios SET clave=?, nombre=?, apellidos=?, domicilio=?, poblacion=?, provincia=?, cp=?, telefono=? WHERE codigo=?";
            PreparedStatement s = conexionBD.prepareStatement(con);

            s.setString(1, clave);
            s.setString(2, nombre);
            s.setString(3, apellidos);
            s.setString(4, domicilio);
            s.setString(5, poblacion);
            s.setString(6, provincia);
            s.setString(7, cp);
            s.setString(8, telefono);
            s.setInt(9, codigo);

            s.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error modificando usuario");
            System.err.println(e.getMessage());
        }
    }

    public void RegistraPedido(int codigo, float importe, ArrayList<Producto> pedido) {
        abrirConexionBD();
        try {

            int idPed = 0;

            Date fechaActual = new Date(System.currentTimeMillis());
            String con = "INSERT INTO pedidos (persona, fecha, importe, estado) VALUES (?, ?, ?, ?)";
            PreparedStatement s = conexionBD.prepareStatement(con, Statement.RETURN_GENERATED_KEYS);
            s.setInt(1, codigo);
            s.setDate(2, fechaActual);
            s.setFloat(3, importe);
            s.setInt(4, 1);
            s.executeUpdate();

            ResultSet rs = s.getGeneratedKeys();
            if (rs.next()) {
                idPed = rs.getInt(1); // Obtener el ID generado
            }

            RegistraDetalle(idPed, pedido);

        } catch (SQLException e) {
            System.err.println("Error registrando pedido");
            System.err.println(e.getMessage());
        }
    }

    public void RegistraDetalle(int codigopedido, ArrayList<Producto> pedido) {
        abrirConexionBD();
        try {
            String con = "INSERT INTO detalle (codigo_pedido, codigo_producto, unidades, precio_unitario, tipo) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement s = conexionBD.prepareStatement(con);
            s.setInt(1, codigopedido);
            for (Producto prod : pedido) {
                s.setInt(2, prod.getCodigo());
                s.setInt(3, prod.getCantidad());
                s.setFloat(4, prod.getPrecio());
                s.setString(5, prod.getTipo());
                s.executeUpdate();
            }

        } catch (SQLException e) {
            System.err.println("Error registrando detalle");
            System.err.println(e.getMessage());
        }
    }

    public ArrayList<PedidoBD> DevolverPedidoUsuario(int codigousuario) {
        
        abrirConexionBD();
        ArrayList<PedidoBD> pedidos = new ArrayList<>();
        try {
            String con = "SELECT codigo, fecha, importe, estado FROM pedidos WHERE persona = ?";
            PreparedStatement s = conexionBD.prepareStatement(con);
            s.setInt(1, codigousuario);
            try (ResultSet resultSet = s.executeQuery()) {
                while (resultSet.next()) {
                    PedidoBD pedido = new PedidoBD();
                    pedido.setCodigoPedido(resultSet.getInt("codigo"));
                    pedido.setFecha(resultSet.getDate("fecha"));
                    pedido.setEstado(resultSet.getInt("estado"));
                    pedido.setImporte(resultSet.getFloat("importe"));
                    pedidos.add(pedido);
                }
            }

        } catch (SQLException e) {
            System.err.println("Error obteniendo info de pedido");
            System.err.println(e.getMessage());
        }

        return pedidos;
    }

    public String DevolverDescripcionProducto(int codigoproducto){
        abrirConexionBD();
        String desc = "";
        try {
            String con = "SELECT descripcion FROM productos WHERE codigo = ?";
            PreparedStatement s = conexionBD.prepareStatement(con);
            s.setInt(1, codigoproducto);
            ResultSet rs = s.executeQuery();
            if (rs.next()) {
                desc = rs.getString("descripcion");
            }
           

        } catch (SQLException e) {
            System.err.println("Error obteniendo la descripción del producto");
            System.err.println(e.getMessage());
        }

        return desc;
    }
    
    public String DevolverEstado(int codigo){
        abrirConexionBD();
        String desc = "";
        try {
            String con = "SELECT descripcion FROM estados WHERE codigo = ?";
            PreparedStatement s = conexionBD.prepareStatement(con);
            s.setInt(1, codigo);
            ResultSet rs = s.executeQuery();
            if (rs.next()) {
                desc = rs.getString("descripcion");
            }
           

        } catch (SQLException e) {
            System.err.println("Error obteniendo estado del pedido");
            System.err.println(e.getMessage());
        }

        return desc;
    }

    public ArrayList<Producto> DevolverProductosDePedido(int codigopedido){
        abrirConexionBD();
        ArrayList<Producto> productos = new ArrayList<>();
        try {
            String con = "SELECT codigo_producto, unidades, precio_unitario, tipo FROM detalle WHERE codigo_pedido = ?";
            PreparedStatement s = conexionBD.prepareStatement(con);
            s.setInt(1, codigopedido);
            
            try (ResultSet resultSet = s.executeQuery()) {
                while (resultSet.next()) {
                    Producto prod = new Producto();
                    prod.setCodigo(resultSet.getInt("codigo_producto"));
                    prod.setCantidad(resultSet.getInt("unidades"));
                    prod.setPrecio(resultSet.getFloat("precio_unitario"));
                    prod.setDescripcion(DevolverDescripcionProducto(resultSet.getInt("codigo_producto")));
                    prod.setTipo(resultSet.getString("tipo"));
                    productos.add(prod);
                }
            }
           

        } catch (SQLException e) {
            System.err.println("Error DevolverProductosDePedido");
            System.err.println(e.getMessage());
        }


        return productos;
    }

    public void CancelarEstadoPedido(int codigopedido){
        abrirConexionBD();
        try {
            String con = "UPDATE pedidos SET estado=4 WHERE codigo=?";
            PreparedStatement s = conexionBD.prepareStatement(con);

            s.setInt(1, codigopedido);

            s.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error cancelando Pedido");
            System.err.println(e.getMessage());
        }

    }

    public int DevolverStock(int codigo){
        abrirConexionBD();
        int stock = 0;
        try {
            String con = "SELECT existencias FROM productos WHERE codigo=?";
            PreparedStatement s = conexionBD.prepareStatement(con);
            s.setInt(1, codigo);

            ResultSet rs = s.executeQuery();
            if (rs.next()) {
                stock = rs.getInt("existencias");
            }

        } catch (SQLException e) {
            System.err.println("Error devolviendo stock");
            System.err.println(e.getMessage());
        }

        return stock;
    }

    public void InsertarMensaje(int codigo_usuario, String nombre, String email, String mensaje){
        abrirConexionBD();
        try {
            String con = "INSERT INTO mensajes (codigo_usuario, nombre, email, mensaje) VALUES (?, ?, ?, ?)";
            PreparedStatement s = conexionBD.prepareStatement(con);
            s.setInt(1, codigo_usuario);
            s.setString(2, nombre );
            s.setString(3,email );
            s.setString(4, mensaje );
            s.executeUpdate();

        } catch (SQLException e) {
            System.err.println("Error registrando detalle");
            System.err.println(e.getMessage());
        }
    }

    public int esAdmin(int codigo) {
        abrirConexionBD();

        int a = 0;

        try {
            String con = "SELECT admin FROM usuarios WHERE codigo=?";
            PreparedStatement s = conexionBD.prepareStatement(con);
            s.setInt(1, codigo);

            ResultSet resultado = s.executeQuery();

            // El usuario/clave se encuentra en la BD

            if (resultado.next()) {
                a = resultado.getInt("admin");
            }
        } catch (Exception e) {

            // Error en la conexión con la BD
            System.err.println("Error verificando usuario/clave");
            System.err.println(e.getMessage());
            e.printStackTrace();
        }

        return a;
    }
}