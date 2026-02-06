package tienda;

import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;


import jakarta.json.Json;
import jakarta.json.JsonArray;
import jakarta.json.JsonObject;
import jakarta.json.JsonReader;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class RecogerCarrito extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        HttpSession session = request.getSession(true);
        AccesoBD con = AccesoBD.getInstance();
        ArrayList<Producto> carritoJSON = new ArrayList<Producto>();
        

        JsonReader jsonReader = Json.createReader(
                new InputStreamReader(
                        request.getInputStream(), "utf-8"));

        

        JsonArray jobj = jsonReader.readArray();
        //System.out.println(jobj);
        
        for (int i = 0; i < jobj.size(); i++) {
            
            JsonObject prod = jobj.getJsonObject(i);
            Producto nuevo = new Producto();
            
            nuevo.setCantidad(prod.getInt("cantidad"));
            nuevo.setCodigo(prod.getInt("codigo"));
            nuevo.setDescripcion(prod.getString("descripcion"));
            nuevo.setStock(prod.getInt("existencias"));
            nuevo.setImagen(prod.getString("imagen"));
            nuevo.setPrecio(Float.parseFloat(prod.get("precio").toString()));
            nuevo.setTipo(prod.getString("tipo"));
            if(nuevo.getCantidad()<=con.DevolverStock(nuevo.getCodigo())){
               // session.removeAttribute("msjErrProducto");
                
            }
            else{
                session.setAttribute("msjErrProducto", "Error Tramitando: " + nuevo.getDescripcion() + " supera el stock existente.");
                System.out.println(session.getAttribute("msjErrProducto"));
            }
            carritoJSON.add(nuevo);
            
        }
        session.setAttribute("carritoJSON", carritoJSON);
        response.sendRedirect("./web/resguardo.jsp");
        
        }
}
