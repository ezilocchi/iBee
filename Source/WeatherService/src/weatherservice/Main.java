/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package weatherservice;

import controller.ConexionDB;
import jMail.Mail;
import model.ManejadorClima;
import model.ManejadorTempActual;
import model.ManejadorUbicar;
import model.SearchLocalidad;

/**
 *
 * @author soriagal
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {

//        WeatherService ws = new WeatherService();
//        ws.updateLocalidad(false);
//        ws.updateLatAndLong(false);
//        ws.updateTemp(false);
//        ws.pedirClima(false);

        /**
         * Lineas para setear el proxy
         */
//        System.getProperties().put( "proxySet", "true" );
//        System.getProperties().put( "proxyHost", "proxyAddress" );
//        System.getProperties().put( "proxyPort", "80uotro" );


        /**
         * Lineas de codigo para actualizar las localidades soportadas
         * por el servicio del weather channel.
         * Previamente se debe eliminar todos los registros de la tabla localidad.
         */
//        SearchLocalidad searchLocalidad = new SearchLocalidad ();
//        searchLocalidad.search();
//        searchLocalidad.guardarLocalidades();

        /**
         * Lineas de codigo para actualizar la latitud y longitus de
         * cada localidad.
         * Previamente la tabla localidades debe estar cargada.
         */
//        ManejadorUbicar ubicar = new ManejadorUbicar ();
//        ubicar.pedirUbicacion();
//        ubicar.guardarUbicacion();

        /**
         * Lines de codigo para actualizar la temperatur actual de
         * cada localidad.
         * Previamente la tabla localidad debe estar cargada.
         */
//        ManejadorTempActual tempActual = new ManejadorTempActual();
//        tempActual.pedirTempActual();
//        tempActual.guardarTempActual();

        /**
         * Lineas de codigo para solicitar la informacion del
         * clima de las zonas registradas en la base de datos.
         */
        ManejadorClima manejador = new ManejadorClima ();
        manejador.pedirClimas();
        manejador.guardarClimas();

        //cierro la coneccion
        ConexionDB conexion = ConexionDB.getInstance();
        conexion.closeConnection();

    }

}
