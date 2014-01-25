/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ibeeproject.persistencia;

import ibeeproject.model.apiar.EstadoApiar;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author farias.facundo
 */
public class GestorEstadoApiar implements Manejable {

    private ConexionPoolBD connPool;
    private Connection conn;
    private ArrayList list;

    public GestorEstadoApiar() {
        connPool = ConexionPoolBD.getInstance();
        list = new ArrayList();
    }

    public ArrayList getTodos() throws Exception {
        try {
            conn = connPool.getConnection();
            String sql = "SELECT * FROM EstadoApiar ORDER BY 1";
            PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                EstadoApiar estado = new EstadoApiar();
                estado.setNumero(rs.getInt("idEstadoCajon"));
                estado.setEstado(rs.getString("estado"));
                list.add(estado);
            }
            ps.close();
            connPool.closeConnection(conn);
        } catch (Exception a) {
            a.printStackTrace();
            System.out.print("Error en conexion BD: GestorEstadoApiar! (getTodos)");
        }
        return list;
    }

    public Object getUltimo() throws Exception {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public ArrayList getAsignado() throws Exception {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public ArrayList getSinAsignar() throws Exception {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public Object getUno(int idObjeto) throws Exception {
        EstadoApiar estado = new EstadoApiar();
        try {
            conn = connPool.getConnection();
            String sql = "SELECT * FROM EstadoApiar where idEstado = ? ";
            PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idObjeto);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                estado.setNumero(rs.getInt("idEstado"));
                estado.setEstado(rs.getString("estado"));
            }
            ps.close();
            connPool.closeConnection(conn);
        } catch (Exception a) {
            a.printStackTrace();
            System.out.print("Error en conexion BD: GestorEstadoApiar! (getUno)");
        }
        return estado;
    }

    public int insertUno(Object object) throws Exception {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public int deleteUno(Object object) throws Exception {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public int updateUno(Object object) throws Exception {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
