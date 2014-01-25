/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller.alarma;

import controller.*;
import alarma.Alarma;
import alarma.Criticidad;
import alarma.EstadoAlarma;
import alarma.HistorialAlarma;
import alarma.Periodicidad;
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
public class GestorCriticidadAlarma {
    private ConexionDB conexion;
    private Connection conn;
    private ArrayList list;

    public GestorCriticidadAlarma()
    {
        conexion = ConexionDB.getInstance();
        list = new ArrayList();
    }

    public ArrayList getTodos() {
    try{
        conn = conexion.getConnection();
        String sql = "SELECT * FROM CriticidadAlarma ORDER BY 1";
        PreparedStatement ps;
        ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
       while (rs.next())
       {
           Criticidad criticidad = new Criticidad();
           criticidad.setNumero(rs.getInt("idCriticidadAlarma"));
           criticidad.setDenominacion(rs.getString("denominacion"));
           criticidad.setDescripcion(rs.getString("descripcion"));
           list.add(criticidad);
       }
//        connPool.closeConnection(conn);
        }catch(Exception a)
            {
            a.printStackTrace();
            System.out.print("Error en conexion BD: GestorCriticidadAlarma !!!");
            }
        return list;
    }

    public Object getUno(int idObjeto) {

        Criticidad criticidad = new Criticidad();
        try{
            conn = conexion.getConnection();
            String sql = "SELECT * FROM CriticidadAlarma where idCriticidadAlarma = ? ";
            PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idObjeto);
            ResultSet rs = ps.executeQuery();
           while (rs.next())
           {
               criticidad.setNumero(rs.getInt("idCriticidadAlarma"));
               criticidad.setDenominacion(rs.getString("denominacion"));
               criticidad.setDescripcion(rs.getString("descripcion"));
           }
//            connPool.closeConnection(conn);
        }catch(Exception a)
            {
            a.printStackTrace();
            System.out.print("Error en conexion BD: GestorCriticidadAlarma !!!");
            }
        return criticidad;
    }

}
