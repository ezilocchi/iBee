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
public class GestorHistorialAlarma {

    private ConexionDB conexion;
    private Connection conn;
    private ArrayList list;

    public GestorHistorialAlarma() {
        conexion = ConexionDB.getInstance();
        list = new ArrayList();
    }

    public ArrayList getTodos() {
        try {
            conn = conexion.getConnection();
            String sql = "SELECT * FROM HistorialAlarma ORDER BY 1";
            PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                HistorialAlarma historialAlarma = new HistorialAlarma();
                historialAlarma.setNumero(rs.getInt("idHistorialAlarma"));
                historialAlarma.setIdAlarma(rs.getInt("idAlarma"));
                historialAlarma.setFecha(UtilFecha.convertiFecha(rs.getDate("fecha")));
                historialAlarma.setValor(rs.getDouble("valor"));
                historialAlarma.setAcciones(rs.getBoolean("acciones"));

                //Regenero la Criticidad
                GestorCriticidadAlarma gestorCriticidad = new GestorCriticidadAlarma();
                Criticidad criticidad = (Criticidad) gestorCriticidad.getUno(rs.getInt("idCriticidad"));
                historialAlarma.setCriticidad(criticidad);

                list.add(historialAlarma);
            }
            ps.close();
//            connPool.closeConnection(conn);
        } catch (Exception a) {
            a.printStackTrace();
            System.out.print("Error en conexion BD: GestorHistorialAlarma! (getTodos)");
        }
        return list;
    }

    public ArrayList getTodos(int idAlarma) {
        try {
            conn = conexion.getConnection();
            String sql = "SELECT * FROM HistorialAlarma where idAlarma = ? ORDER BY 1";
            PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idAlarma);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                HistorialAlarma historialAlarma = new HistorialAlarma();
                historialAlarma.setNumero(rs.getInt("idHistorialAlarma"));
                historialAlarma.setIdAlarma(rs.getInt("idAlarma"));
                historialAlarma.setFecha(UtilFecha.convertiFecha(rs.getDate("fecha")));
                historialAlarma.setValor(rs.getDouble("valor"));
                historialAlarma.setAcciones(rs.getBoolean("acciones"));

                //Regenero la Criticidad
                GestorCriticidadAlarma gestorCriticidad = new GestorCriticidadAlarma();
                Criticidad criticidad = (Criticidad) gestorCriticidad.getUno(rs.getInt("idCriticidad"));
                historialAlarma.setCriticidad(criticidad);

                list.add(historialAlarma);
            }
            ps.close();
//            connPool.closeConnection(conn);
        } catch (Exception a) {
            a.printStackTrace();
            System.out.print("Error en conexion BD: GestorHistorialAlarma! (getTodos)");
        }
        return list;
    }

    public Object getUltimo() {
        HistorialAlarma historialAlarma = new HistorialAlarma();
        try {
            conn = conexion.getConnection();
            String sql = "SELECT * FROM HistorialAlarma WHERE idHistorialAlarma = (select MAX(idHistorialAlarma) from HistorialAlarma)";
            PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                historialAlarma.setNumero(rs.getInt("idHistorialAlarma"));
                historialAlarma.setIdAlarma(rs.getInt("idAlarma"));

                historialAlarma.setFecha(UtilFecha.convertiFecha(rs.getDate("fecha")));
                historialAlarma.setValor(rs.getDouble("valor"));
                historialAlarma.setAcciones(rs.getBoolean("acciones"));

                //Regenero la Criticidad
                GestorCriticidadAlarma gestorCriticidad = new GestorCriticidadAlarma();
                Criticidad criticidad = (Criticidad) gestorCriticidad.getUno(rs.getInt("idCriticidad"));
                historialAlarma.setCriticidad(criticidad);
            }
            ps.close();
//            connPool.closeConnection(conn);
        } catch (Exception a) {
            a.printStackTrace();
            System.out.print("Error en conexion BD: GestorHistorialAlarma !!! (getUltimo)");
        }
        return historialAlarma;
    }

    public Object getUno(int idObjeto) {
        HistorialAlarma historialAlarma = new HistorialAlarma();
        try {
            conn = conexion.getConnection();
            String sql = "SELECT * FROM HistorialAlarma where idHistorialAlarma = ? ";
            PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idObjeto);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                historialAlarma.setNumero(rs.getInt("idHistorialAlarma"));
                historialAlarma.setIdAlarma(rs.getInt("idAlarma"));
                historialAlarma.setFecha(UtilFecha.convertiFecha(rs.getDate("fecha")));
                historialAlarma.setValor(rs.getDouble("valor"));
                historialAlarma.setAcciones(rs.getBoolean("acciones"));

                //Regenero la Criticidad
                GestorCriticidadAlarma gestorCriticidad = new GestorCriticidadAlarma();
                Criticidad criticidad = (Criticidad) gestorCriticidad.getUno(rs.getInt("idCriticidad"));
                historialAlarma.setCriticidad(criticidad);

                list.add(historialAlarma);
            }
            ps.close();
//            connPool.closeConnection(conn);
        } catch (Exception a) {
            a.printStackTrace();
            System.out.print("Error en conexion BD: GestorHistorialAlarma! (getUno)");
        }
        return historialAlarma;
    }

    public Object getUno(int idObjeto, int idAlarma) {
        HistorialAlarma historialAlarma = new HistorialAlarma();
        try {
            conn = conexion.getConnection();
            String sql = "SELECT * FROM HistorialAlarma where idHistorialAlarma = ? and idAlarma = ?";
            PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idObjeto);
            ps.setInt(2, idAlarma);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                historialAlarma.setNumero(rs.getInt("idHistorialAlarma"));
                historialAlarma.setIdAlarma(rs.getInt("idAlarma"));
                historialAlarma.setFecha(UtilFecha.convertiFecha(rs.getDate("fecha")));
                historialAlarma.setValor(rs.getDouble("valor"));
                historialAlarma.setAcciones(rs.getBoolean("acciones"));

                //Regenero el tipo alarma
                GestorCriticidadAlarma gestorCriticidad = new GestorCriticidadAlarma();
                Criticidad criticidad = (Criticidad) gestorCriticidad.getUno(rs.getInt("idCriticidad"));
                historialAlarma.setCriticidad(criticidad);

                list.add(historialAlarma);
            }
            ps.close();
//            connPool.closeConnection(conn);
        } catch (Exception a) {
            a.printStackTrace();
            System.out.print("Error en conexion BD: GestorHistorialAlarma! (getUno)");
        }
        return historialAlarma;
    }

    public int insertUno(Object object) {
        HistorialAlarma historialAlarma = (HistorialAlarma) object;
        int resultado = 0;
        try {
            conn = conexion.getConnection();
            String sql = "INSERT INTO HistorialAlarma (idHistorialAlarma, idAlarma, " +
                    " fecha, valor, idCriticidad, acciones) " +
                    " values (?,?,?,?,?,?)";
            PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ps.setInt(1, historialAlarma.getNumero());
            ps.setInt(2, historialAlarma.getIdAlarma());
            ps.setDate(3, UtilFecha.convertiFecha(historialAlarma.getFecha()));
            ps.setDouble(4, historialAlarma.getValor());
            ps.setInt(5, historialAlarma.getCriticidad().getNumero());
            ps.setBoolean(6, historialAlarma.isAcciones());

            resultado = ps.executeUpdate();

            ps.close();
//            connPool.closeConnection(conn);
        } catch (Exception a) {
            a.printStackTrace();
            System.out.print("Error en conexion BD: GestorHistorialAlarma !!! (insertUno)");
        }
        return resultado;
    }

}
