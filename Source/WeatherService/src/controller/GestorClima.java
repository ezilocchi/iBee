/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Clima;
import soporte.UtilFecha;

/**
 *
 * @author soria.federico
 */
public class GestorClima {

    private ConexionDB conexion;
    private Connection conn;

    public GestorClima () {
        conexion = ConexionDB.getInstance();
    }

    public void insertar(Clima clima) {
        int idClima = getUltimoId(clima.getIdZona());
        idClima++;
        clima.setIdClima(idClima);
        conn = conexion.getConnection();
        String sql="INSERT INTO clima VALUES ((?),(?),(?),(?),(?),(?),(?),(?),(?),(?),(?),(?),(?),(?),(?),(?))";
		PreparedStatement ps;
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, clima.getIdClima());
            ps.setInt(2, clima.getIdZona());
            ps.setDate(3, UtilFecha.convertiFecha(clima.getFechaHora()));
            ps.setString(4, clima.getSalidaDelSol());
            ps.setString(5, clima.getPuestaDelSol());
            ps.setDouble(6, clima.getTemperatura());
            ps.setInt(7, clima.getIconoTemperatura());
            ps.setDouble(8, clima.getSensacionTermica());
            ps.setString(9, clima.getDescripcionTemperatura());
            ps.setDouble(10, clima.getPresion());
            ps.setDouble(11, clima.getVelocidadDelViento());
            ps.setString(12, clima.getDireccionDelViento());
            ps.setDouble(13, clima.getHumedad());
            ps.setDouble(14, clima.getIndiceUV());
            ps.setString(15, clima.getFaseLuna());
            ps.setInt(16, clima.getIconoLuna());
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    private int getUltimoId (int idZona) {
        conn = conexion.getConnection();
        int lastIdClima = 0;
        PreparedStatement ps;
        ResultSet rs;
        String sql = "SELECT MAX(idClima) as mayor FROM `ibee`.`clima` WHERE idZona = (?)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idZona);
            rs = ps.executeQuery();
            if (rs.next()) {
                lastIdClima = rs.getInt("mayor");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } 
        return lastIdClima;
    }
}
