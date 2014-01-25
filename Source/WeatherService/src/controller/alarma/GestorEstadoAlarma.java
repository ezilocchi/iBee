/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller.alarma;

import controller.*;
import alarma.Alarma;
import alarma.EstadoAlarma;
import alarma.TipoAlarma;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import soporte.UtilFecha;
/**
 *
 * @author carranza.matias
 */
public class GestorEstadoAlarma {

    private ConexionDB conexion;
    private Connection conn;
    private ArrayList list;

    public GestorEstadoAlarma()
    {
        conexion = ConexionDB.getInstance();
        list = new ArrayList();
    }

    public ArrayList getTodos() {
    try{
        conn = conexion.getConnection();
        String sql = "SELECT * FROM EstadoAlarma ORDER BY 1";
        PreparedStatement ps;
        ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
       while (rs.next())
       {
           EstadoAlarma estado = new EstadoAlarma();
           estado.setNumero(rs.getInt("idEstado"));
           estado.setEstado(rs.getString("estado"));
           list.add(estado);
       }
        ps.close();
//        connPool.closeConnection(conn);
        }catch(Exception a)
            {
            a.printStackTrace();
            System.out.print("Error en conexion BD: GestorEstadoAlarma! (getTodos)");
            }
        return list;
    }

    public Object getUno(int idObjeto) {
        EstadoAlarma estado = new EstadoAlarma();
        try{
            conn = conexion.getConnection();
            String sql = "SELECT * FROM EstadoAlarma where idEstado = ? ";
            PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idObjeto);
            ResultSet rs = ps.executeQuery();
           while (rs.next())
           {
               estado.setNumero(rs.getInt("idEstado"));
               estado.setEstado(rs.getString("estado"));
           }
            ps.close();
//            connPool.closeConnection(conn);
        }catch(Exception a)
            {
            a.printStackTrace();
            System.out.print("Error en conexion BD: GestorEstadoAlarma! (getUno)");
            }
        return estado;
    }

}