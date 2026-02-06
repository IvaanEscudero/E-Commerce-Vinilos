package tienda;

import java.util.Date;

public class PedidoBD {
    private int codigoPedido;
    private Date fecha;
    private int estado;
    private float importe;
    private int codigousuario;
    public int getCodigousuario() {
        return codigousuario;
    }
    public void setCodigousuario(int codigousuario) {
        this.codigousuario = codigousuario;
    }
    public int getCodigoPedido() {
        return codigoPedido;
    }
    public void setCodigoPedido(int codigoPedido) {
        this.codigoPedido = codigoPedido;
    }
    public Date getFecha() {
        return fecha;
    }
    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
    public int getEstado() {
        return estado;
    }
    public void setEstado(int estado) {
        this.estado = estado;
    }
    public float getImporte() {
        return importe;
    }
    public void setImporte(float importe) {
        this.importe = importe;
    }
    
}
