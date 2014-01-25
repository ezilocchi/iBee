/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Localidad;

/**
 *
 * @author soria.federico
 */
public class GestorLocalidad {

    private ConexionDB conexion;
    private Connection conn;

    public GestorLocalidad () {
        conexion = ConexionDB.getInstance();
    }

    public void insertar (Localidad localidad) {
        conn = conexion.getConnection();
        String sql = "INSERT INTO localidad (idLocalidad, nombre) VALUES ((?),(?))";
        PreparedStatement ps;
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, localidad.getIdLocalidad());
            ps.setString(2, localidad.getNombre());
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public ArrayList getLocalidades () {
        conn = conexion.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql = "SELECT distinct idLocalidad FROM localidad"; //TODO preguntar si no vienen repetidos
		ArrayList localidades=new ArrayList();
        try {
            ps = conn.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                localidades.add(rs.getString("idLocalidad"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return localidades;
    }

    public void guardarUbicacion (Localidad localidad) {
        conn = conexion.getConnection();
        String sql = "UPDATE localidad SET latitud = (?), longitud = (?) WHERE idLocalidad = (?)";
        PreparedStatement ps;
        try {
            ps = conn.prepareStatement(sql);
            ps.setDouble(1, localidad.getLatitud());
            ps.setDouble(2, localidad.getLongitud());
            ps.setString(3, localidad.getIdLocalidad());
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void guardarTempActual (Localidad localidad) {
        conn = conexion.getConnection();
        String sql = "UPDATE localidad SET temperatura = (?), iconoTemperatura = (?) WHERE idLocalidad = (?)";
        PreparedStatement ps;
        try {
            ps = conn.prepareStatement(sql);
            ps.setDouble(1, localidad.getTemperatura());
            ps.setInt(2, localidad.getIconoTemperatura());
            ps.setString(3, localidad.getIdLocalidad());
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void borrarLocalidades () {
        conn = conexion.getConnection();
        String sql = "delete from localidad where idLocalidad is not null";
        PreparedStatement ps;
        try {
            ps = conn.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

}
