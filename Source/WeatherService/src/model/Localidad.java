/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

/**
 *
 * @author soria.federico
 */
public class Localidad {

    private String idLocalidad;
    private String nombre;
    private double latitud;
    private double longitud;
    private double temperatura;
    private int iconoTemperatura;

    public String getNombre() {
        return nombre;
    }

    public String getIdLocalidad() {
        return idLocalidad;
    }

    public void setNombre(String Nombre) {
        this.nombre = Nombre;
    }

    public void setIdLocalidad(String idLocalidad) {
        this.idLocalidad = idLocalidad;
    }

    public double getLatitud() {
        return latitud;
    }

    public double getLongitud() {
        return longitud;
    }

    public void setLatitud(double latitud) {
        this.latitud = latitud;
    }

    public void setLongitud(double longitud) {
        this.longitud = longitud;
    }

    public int getIconoTemperatura() {
        return iconoTemperatura;
    }

    public double getTemperatura() {
        return temperatura;
    }

    public void setIconoTemperatura(int iconoTemperatura) {
        this.iconoTemperatura = iconoTemperatura;
    }

    public void setTemperatura(double temperatura) {
        this.temperatura = temperatura;
    }

}
