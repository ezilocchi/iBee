/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author soriagal
 */
public class ConexionDB {
    private String DB = "ibee";
    private String user = "root";
    private String pass = "root";
    private String url = "jdbc:mysql://localhost:3306/" + DB;

    private Connection conn = null;

    private static ConexionDB instance = null;

    private ConexionDB(){
          try {
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
            } catch (InstantiationException ex) {
                Logger.getLogger(ConexionDB.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IllegalAccessException ex) {
                Logger.getLogger(ConexionDB.class.getName()).log(Level.SEVERE, null, ex);
            }

             conn = DriverManager.getConnection(url,user,pass);

             if (conn != null) {
                System.out.println("Conexión a base de datos "+url+" ... Ok");
                //conn.close();
             }
          } catch(SQLException ex) {
             System.out.println("Hubo un problema al intentar conectarse con la base de datos "+url);
          } catch(ClassNotFoundException ex2) {
             System.out.println(ex2);
          }
    }

    public static ConexionDB getInstance() {
        if (instance == null) {
            instance = new ConexionDB();
        }
        return instance;
    }

    public Connection getConnection (){
        return conn;
    }

    public void closeConnection () {
        try {
            conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

}
