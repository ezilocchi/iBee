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
import model.Zona;

/**
 *
 * @author soria.federico
 */
public class GestorZona {

    private ConexionDB conexion;
    private Connection conn;

    public GestorZona () {
        conexion = ConexionDB.getInstance();
    }

    public ArrayList getZonas () {
        conn = conexion.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql = "SELECT idZona, idLocalidad FROM `ibee`.`zona`";
		ArrayList zonas=new ArrayList();
        Zona zona;
        try {
            ps = conn.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                zona = new Zona();
                zona.setIdZona(rs.getInt("idZona"));
                zona.setIdLocalidad(rs.getString("idLocalidad"));
                zonas.add(zona);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } 
        return zonas;
    }

    public ArrayList getLocalidades () {
        conn = conexion.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql = "SELECT distinct idLocalidad FROM `ibee`.`zona`"; //TODO preguntar si no vienen repetidos
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

}
