package tienda;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class EnviarMensaje extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
        AccesoBD con = AccesoBD.getInstance();
        HttpSession session =  request.getSession(false);

        if(session.getAttribute("usuario")==null){
            response.sendRedirect("./index.jsp");
        }
        else{
            int codigo = (int)session.getAttribute("usuario");
            String nombre = request.getParameter("nombre");
            String email = request.getParameter("email");
            String mensaje = request.getParameter("mensaje");

            con.InsertarMensaje(codigo, nombre, email, mensaje);
            response.sendRedirect("./web/tienda.jsp");
        }
    }
}
