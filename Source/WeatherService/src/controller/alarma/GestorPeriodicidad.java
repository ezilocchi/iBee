/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller.alarma;

import controller.*;
import alarma.Alarma;
import alarma.EstadoAlarma;
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
public class GestorPeriodicidad {

    private ConexionDB conexion;
    private Connection conn;
    private ArrayList list;

    public GestorPeriodicidad() {
        conexion = ConexionDB.getInstance();
        list = new ArrayList();
    }

    public ArrayList getTodos() {
        try {
            conn = conexion.getConnection();
            String sql = "SELECT * FROM Periodicidad ORDER BY 1";
            PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Periodicidad periodicidad = new Periodicidad();
                periodicidad.setNumero(rs.getInt("idPeriodicidad"));
                periodicidad.setDenominacion(rs.getString("denominacion"));
                list.add(periodicidad);
            }
            ps.close();
//            connPool.closeConnection(conn);
        } catch (Exception a) {
            a.printStackTrace();
            System.out.print("Error en conexion BD: GestorPeriodicidad! (getTodos)");
        }
        return list;
    }


    public Object getUno(int idObjeto) {
        Periodicidad periodicidad = new Periodicidad();
        try {
            conn = conexion.getConnection();
            String sql = "SELECT * FROM Periodicidad where idPeriodicidad = ? ";
            PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idObjeto);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                periodicidad.setNumero(rs.getInt("idPeriodicidad"));
                periodicidad.setDenominacion(rs.getString("denominacion"));
                list.add(periodicidad);
            }
            ps.close();
//            connPool.closeConnection(conn);
        } catch (Exception a) {
            a.printStackTrace();
            System.out.print("Error en conexion BD: GestorPeriodicidad! (getUno)");
        }
        return periodicidad;
    }

}
