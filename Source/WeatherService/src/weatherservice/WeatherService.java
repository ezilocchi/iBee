/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package weatherservice;

import controller.ConexionDB;
import model.ManejadorClima;
import model.ManejadorTempActual;
import model.ManejadorUbicar;
import model.SearchLocalidad;

/**
 * Clase para manejar la libreria del servicio de clima brindado por el
 * Weather Channel.
 * @author soria.federico
 */
public class WeatherService {

    private SearchLocalidad searchLocalidad = new SearchLocalidad ();
    private ManejadorUbicar ubicar = new ManejadorUbicar ();
    private ManejadorTempActual tempActual = new ManejadorTempActual();
    private ManejadorClima manejador = new ManejadorClima ();
    private String address;
    private String port;

    /**
     * Setea la configuracion del proxy.
     * @param address
     * @param port
     */
    public void setearProxy (String address, String port) {
        this.address = address;
        this.port = port;
    }

    /**
     * Metodo para actualizar las localidades soportadas por el servicio del
     * weather channel. El metodo elimina todos los registros de la tabla
     * localidad y vuelve a cargarla con el IdLocalidad y nombre.
     * Se recomienda usarlo con intervalos de tiempo prudenciales.
     * @param conProxy
     */
    public void updateLocalidad (boolean conProxy) {
        if (conProxy) {
            System.getProperties().put( "proxySet", "true" );
            System.getProperties().put( "proxyHost", address );
            System.getProperties().put( "proxyPort", port );
        }
        searchLocalidad.borrarLocalidades();
        searchLocalidad.search();
        searchLocalidad.guardarLocalidades();
        //cierro la coneccion
        ConexionDB conexion = ConexionDB.getInstance();
        conexion.closeConnection();
    }

    /**
     * Metodo para actualizar la latitud y longitus de cada localidad.
     * Previamente la tabla localidades debe estar cargada.
     * @param conProxy
     */
    public void updateLatAndLong (boolean conProxy) {
        if (conProxy) {
            System.getProperties().put( "proxySet", "true" );
            System.getProperties().put( "proxyHost", address );
            System.getProperties().put( "proxyPort", port );
        }
        ubicar.pedirUbicacion();
        ubicar.guardarUbicacion();
        //cierro la coneccion
        ConexionDB conexion = ConexionDB.getInstance();
        conexion.closeConnection();
    }

    /**
     * Metodo para actualizar la temperatur actual de cada localidad.
     * Previamente la tabla localidad debe estar cargada.
     * @param conProxy
     */
    public void updateTemp (boolean conProxy) {
        if (conProxy) {
            System.getProperties().put( "proxySet", "true" );
            System.getProperties().put( "proxyHost", address );
            System.getProperties().put( "proxyPort", port );
        }
        tempActual.pedirTempActual();
        tempActual.guardarTempActual();
        //cierro la coneccion
        ConexionDB conexion = ConexionDB.getInstance();
        conexion.closeConnection();
    }

    /**
     * Metodo para solicitar la informacion del clima de las zonas registradas
     * Este metodo debe ejecutarse periodicamente para generar el historial
     * de los climas.
     * @param conProxy
     */
    public void pedirClima (boolean conProxy) {
        if (conProxy) {
            System.getProperties().put( "proxySet", "true" );
            System.getProperties().put( "proxyHost", address );
            System.getProperties().put( "proxyPort", port );
        }
        manejador.pedirClimas();
        manejador.guardarClimas();
        //cierro la coneccion
        ConexionDB conexion = ConexionDB.getInstance();
        conexion.closeConnection();
    }

}
