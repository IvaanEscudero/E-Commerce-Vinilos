package tienda;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class CambiarContra extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session =  request.getSession(false);
        AccesoBD con = AccesoBD.getInstance();


        System.out.println("clave"+request.getParameter("clave"));

        String clave = request.getParameter("clave");

        String clave2 = request.getParameter("clave2");

        String clave256 = encriptarSHA256(request.getParameter("clave"));

        if (!clave.equals(clave2)) {
            session.setAttribute("error", "Las claves no coinciden");
            response.sendRedirect("./web/usuario.jsp");
        }
        else{
            con.ModificarDatosUsuario((int)session.getAttribute("usuario"),clave256 , request.getParameter("nom"), request.getParameter("ape"), request.getParameter("dom"), request.getParameter("pob"), request.getParameter("prov"), request.getParameter("cp"), request.getParameter("tel"));
            response.sendRedirect("./web/tienda.jsp");
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
