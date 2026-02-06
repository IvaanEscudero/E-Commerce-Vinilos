package tienda;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Nombre del usuario
        String usuario = request.getParameter("usuario");
    
        // Clave
        String clave = request.getParameter("clave");
    
        String clave256 = encriptarSHA256(clave);

        // URL a la que debemos volver
    
        String url = request.getParameter("url");
    
        // Accedemos al entorno de sesión y si no está creado lo creamos
    
        HttpSession session = request.getSession(true);
    
        AccesoBD con = AccesoBD.getInstance();
    

        if ((usuario != null) && (clave != null)) {
            int codigo = con.comprobarUsuarioBD(usuario,clave256);
            if (codigo>0) {
                session.setAttribute("usuario",codigo);
            }
            else {
                session.setAttribute("mensaje","Usuario y/o clave incorrectos");
            }
        }
    
        
        request.getRequestDispatcher(url).forward(request, response);
        
        
    
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
