package tienda;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class CambiarEstado extends HttpServlet{
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

       String codigo_pedido = request.getParameter("cosoeste");
       int codped = Integer.parseInt(codigo_pedido);
       AccesoBD con = AccesoBD.getInstance();

       con.CancelarEstadoPedido(codped);
       response.sendRedirect("./web/usuario.jsp");

    }
}
