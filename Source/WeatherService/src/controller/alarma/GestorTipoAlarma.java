/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller.alarma;

import alarma.TipoAlarma;
import controller.ConexionDB;
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
public class GestorTipoAlarma {

    private ConexionDB conexion;
    private Connection conn;
    private ArrayList list;

    public GestorTipoAlarma () {
        conexion = ConexionDB.getInstance();
        list = new ArrayList();
    }
    public ArrayList getTodos() {
        try {
            conn = conexion.getConnection();
            String sql = "SELECT * FROM TipoAlarma ORDER BY 1";
            PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                TipoAlarma tipoAlarma = new TipoAlarma();
                tipoAlarma.setNumero(rs.getInt("idTipoAlarma"));
                tipoAlarma.setDenominacion(rs.getString("denominacion"));
                tipoAlarma.setDescripcion(rs.getString("descripcion"));
                list.add(tipoAlarma);
            }
            ps.close();
//            conexion.closeConnection(conn);
        } catch (Exception a) {
            a.printStackTrace();
            System.out.print("Error en conexion BD: GestorTipoAlarma! (getTodos)");
        }
        return list;
    }


    public Object getUno(int idObjeto) {
        TipoAlarma tipoAlarma = new TipoAlarma();
        try {
            conn = conexion.getConnection();
            String sql = "SELECT * FROM TipoAlarma where idTipoAlarma = ? ";
            PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idObjeto);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                tipoAlarma.setNumero(rs.getInt("idTipoAlarma"));
                tipoAlarma.setDenominacion(rs.getString("denominacion"));
                tipoAlarma.setDescripcion(rs.getString("descripcion"));
                list.add(tipoAlarma);
            }
            ps.close();
//            connPool.closeConnection(conn);
        } catch (Exception a) {
            a.printStackTrace();
            System.out.print("Error en conexion BD: GestorTipoAlarma! (getUno)");
        }
        return tipoAlarma;
    }

}
