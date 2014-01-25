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
import java.util.Date;
import soporte.UtilFecha;

/**
 *
 * @author carranza.matias
 */
public class GestorAlarma {

    private ConexionDB conexion;
    private Connection conn;
    private ArrayList list;
    private ArrayList <String> mails;

    public GestorAlarma() {
        conexion = ConexionDB.getInstance();
        list = new ArrayList();
        mails = new ArrayList();
    }

    public ArrayList getAlarmasMedicion(int idZona, double medicion) {
        try {
            conn = conexion.getConnection();
            PreparedStatement ps;

            String sql = "SELECT * " +
                    "FROM alarma a " +
                    "WHERE fechaInicio <= NOW() AND fechaFin >= NOW() AND activado = 1 " +
                    "AND idZona = ? " +
                    "AND ? NOT BETWEEN rangoDesde AND rangoHasta";

            ps = conn.prepareStatement(sql);
            ps.setInt(1, idZona);
            ps.setDouble(2, medicion);
//            System.out.println(idZona);
//            System.out.println(medicion);
//            System.out.println(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                Alarma alarma = new Alarma();
                alarma.setNumero(rs.getInt("idAlarma"));
                alarma.setIdZona(rs.getInt("idZona"));
                alarma.setDenominacion(rs.getString("denominacion"));
                alarma.setDescripcion(rs.getString("descripcion"));
                alarma.setOrigen(rs.getString("origen"));
                alarma.setFechaCreacion(UtilFecha.convertiFecha(rs.getDate("fechaCreacion")));
                alarma.setFechaInicio(UtilFecha.convertiFecha(rs.getDate("fechaInicio")));
                alarma.setFechaFin(UtilFecha.convertiFecha(rs.getDate("fechaFin")));
                alarma.setActivado(rs.getBoolean("activado"));
                alarma.setRangoDesde(rs.getInt("rangoDesde"));
                alarma.setRangoHasta(rs.getInt("rangoHasta"));
                alarma.setIdCargo(rs.getInt("idCargo"));

                //Regenero el historialAlarma
                GestorHistorialAlarma gestorHistorialAlarma = new GestorHistorialAlarma();
                alarma.setHistorialAlarma(gestorHistorialAlarma.getTodos(rs.getInt("idAlarma")));


                list.add(alarma);
            }
//            connPool.closeConnection(conn);
        } catch (Exception a) {
            a.printStackTrace();
            System.out.print("Error en conexion BD: GestorAlarma!!! (getAlarmasMedicion");
        }
        return list;
    }

    public ArrayList getMails(int idCargo) {
        try {
            conn = conexion.getConnection();
            PreparedStatement ps;

            String sql = "SELECT email FROM cargo c, empleado e " +
                    " WHERE c.idCargo = e.idCargo AND c.idCargo = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idCargo);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                mails.add(rs.getString("email"));
            }

        } catch (Exception a) {
            a.printStackTrace();
            System.out.print("Error en conexion BD: GestorAlarma!!! (getMails");
        }
        return mails;
    }

    public int setMensaje(int idAlarma, String texto, Date fecha) {
        int resultado = 0;
        try {
            conn = conexion.getConnection();
            PreparedStatement ps;

            String sql = "insert into mensajes (idAlarma ,texto, fecha) values (?,?,?)";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idAlarma);
            ps.setString(2, texto);
            ps.setDate(3, UtilFecha.convertiFecha(fecha));

            resultado = ps.executeUpdate();

        } catch (Exception a) {
            a.printStackTrace();
            System.out.print("Error en conexion BD: GestorAlarma!!! (getMails");
        }
        return resultado;
    }
}
