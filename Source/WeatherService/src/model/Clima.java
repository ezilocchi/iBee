/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Fede 
 */
public class Clima implements Cloneable {

    private int idClima;
    private int idZona;
    private Date fechaHora;
    private String salidaDelSol;
    private String puestaDelSol;
    private double temperatura;
    private int iconoTemperatura;
    private double sensacionTermica;
    private String descripcionTemperatura;
    private double presion;
    private double velocidadDelViento;
    private String direccionDelViento;
    private double humedad;
    private double indiceUV;
    private String faseLuna;
    private int iconoLuna;

    public String mostrarFecha () {
        SimpleDateFormat formatFecha = new SimpleDateFormat("dd/MM/yyyy");
        String cadenaFecha = formatFecha.format(fechaHora);
        return cadenaFecha;
    }

    public String mostrarHora () {
        SimpleDateFormat formatHora = new SimpleDateFormat("H:mm:ss");
        String cadenaHora = formatHora.format(fechaHora);
        return cadenaHora;
    }

    public String getPuestaDelSol() {
        return puestaDelSol;
    }

    public String getSalidaDelSol() {
        return salidaDelSol;
    }

    public String getDescripcionTemperatura() {
        return descripcionTemperatura;
    }

    public String getDireccionDelViento() {
        return direccionDelViento;
    }

    public String getFaseLuna() {
        return faseLuna;
    }

    public Date getFechaHora() {
        return fechaHora;
    }

    public double getHumedad() {
        return humedad;
    }

    public int getIconoLuna() {
        return iconoLuna;
    }

    public int getIconoTemperatura() {
        return iconoTemperatura;
    }

    public int getIdClima() {
        return idClima;
    }

    public int getIdZona() {
        return idZona;
    }

    public double getIndiceUV() {
        return indiceUV;
    }

    public double getPresion() {
        return presion;
    }

    public double getSensacionTermica() {
        return sensacionTermica;
    }

    public double getTemperatura() {
        return temperatura;
    }

    public double getVelocidadDelViento() {
        return velocidadDelViento;
    }

    public void setPuestaDelSol(String PuestaDelSol) {
        this.puestaDelSol = PuestaDelSol;
    }

    public void setSalidaDelSol(String SalidaDelSol) {
        this.salidaDelSol = SalidaDelSol;
    }

    public void setDescripcionTemperatura(String descripcionTemperatura) {
        this.descripcionTemperatura = descripcionTemperatura;
    }

    public void setDireccionDelViento(String direccionDelViento) {
        this.direccionDelViento = direccionDelViento;
    }

    public void setFaseLuna(String faseLuna) {
        this.faseLuna = faseLuna;
    }

    public void setFechaHora(Date fechaHora) {
        this.fechaHora = fechaHora;
    }

    public void setHumedad(double humedad) {
        this.humedad = humedad;
    }

    public void setIconoLuna(int iconoLuna) {
        this.iconoLuna = iconoLuna;
    }

    public void setIconoTemperatura(int iconoTemperatura) {
        this.iconoTemperatura = iconoTemperatura;
    }

    public void setIndiceUV(double indiceUV) {
        this.indiceUV = indiceUV;
    }

    public void setPresion(double presion) {
        this.presion = presion;
    }

    public void setSensacionTermica(double sensacionTermica) {
        this.sensacionTermica = sensacionTermica;
    }

    public void setTemperatura(double temperatura) {
        this.temperatura = temperatura;
    }

    public void setVelocidadDelViento(double velocidadDelViento) {
        this.velocidadDelViento = velocidadDelViento;
    }

    public void setIdClima(int idClima) {
        this.idClima = idClima;
    }

    public void setIdZona(int idZona) {
        this.idZona = idZona;
    }

    @Override
    public Object clone(){
        Object obj=null;
        try{
            obj=super.clone();
        }catch(CloneNotSupportedException ex){
            System.out.println(" no se puede duplicar");
        }
        return obj;
    }


}
