package tienda;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class RegisterPedido extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
        AccesoBD con = AccesoBD.getInstance();
        HttpSession session = request.getSession();
        

        if(session.getAttribute("usuario")==null){
            
            response.sendRedirect("./index.jsp");
        }
        else{
            float importe = Float.parseFloat(request.getParameter("importe"));
            int codigo = (int)session.getAttribute("usuario");
            ArrayList<Producto> ped = (ArrayList<Producto>)session.getAttribute("carritoJSON");
            System.out.println((ArrayList<Producto>)session.getAttribute("carritoJSON"));
            con.RegistraPedido(codigo,importe, ped);
            response.sendRedirect("./web/pedidofin.jsp");
        }

    }
}
