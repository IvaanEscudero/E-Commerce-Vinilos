package tienda;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Register extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("clave");
        String clave2 = request.getParameter("clave2");
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String domicilio = request.getParameter("domicilio");
        String poblacion = request.getParameter("poblacion");
        String provincia = request.getParameter("provincia");
        int cp = Integer.parseInt(request.getParameter("cp"));
        int telefono = Integer.parseInt(request.getParameter("telefono"));

        AccesoBD con = AccesoBD.getInstance();

        HttpSession session = request.getSession(true);

        

        System.out.println("clave:" + clave + "clave2:" + clave2);
        if (con.ExisteUsuario(usuario)) {
            // Si existe el usuario da error
            session.setAttribute("error", "El usuario ya existe. Por favor, elige otro nombre de usuario.");
           // request.getRequestDispatcher("./registro.jsp").forward(request, response);
           response.sendRedirect("./register.jsp");
        } else {
            // Si no existe el usuario
            if (!clave.equals(clave2)) {
                session.setAttribute("error", "Las claves no coinciden");
                //request.getRequestDispatcher("./registro.jsp").forward(request, response);
                response.sendRedirect("./register.jsp");

            } else {
                session.removeAttribute("error");

                String clave256 = encriptarSHA256(clave);

                con.RegistraUsuario(usuario, clave256, nombre, apellidos, domicilio, poblacion, provincia, cp, telefono);
                response.sendRedirect("./index.jsp");
            }
        }

    }
    public static String encriptarSHA256(String password) {
        try {
            
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            
            byte[] hash = digest.digest(password.getBytes());
            
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
           
            e.printStackTrace();
            return null;
        }
    }
}
