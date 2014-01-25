/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import alarma.model.ManejadorAlarmas;
import controller.GestorClima;
import controller.GestorZona;
import java.util.ArrayList;
import java.util.HashMap;
import org.w3c.dom.Document;

/**
 *
 * @author soria.federico
 */
public class ManejadorClima {

    private WebWeather webWeather;
    private GestorZona gestorZona = new GestorZona();
    private ArrayList idLocalidades;
    private HashMap documents; //key: idLocalidades, object: document con el xml
    private HashMap climas = new HashMap(); //key: idLocalidades, object: objeto clima

    public void pedirClimas() {
        idLocalidades = gestorZona.getLocalidades();

//        idLocalidades = new ArrayList ();
//        idLocalidades.add("ARCA2189");//si
//        idLocalidades.add("ARCA5184");//si
//        idLocalidades.add("ARCA2434");//no
//        idLocalidades.add("ARCA5107");//si

        webWeather = new WebWeather();
        documents = webWeather.getDocuments(idLocalidades);

        for (int i = 0; i < documents.size(); i++) {
            Clima clima;
            LectorWeatherXml lector = new LectorWeatherXml((Document) documents.get(idLocalidades.get(i)));
            clima = lector.getClima();
            //pregunta si devolvio el clima actual
            if (clima.getIdZona() != -1) {
                climas.put(idLocalidades.get(i), clima);
            } else {
                System.out.println("No se actualizo el clima de esta localidad");
            }
        }
    }

    public void guardarClimas() {
        GestorClima gestorClima = new GestorClima();
        ArrayList climasPorGuardar = vincularClimas();
        ManejadorAlarmas manejadorAlarmas = new ManejadorAlarmas();
        System.out.println(".");
        for (int i = 0; i < climasPorGuardar.size(); i++) {
            Clima clima = (Clima) climasPorGuardar.get(i);
            gestorClima.insertar(clima);
            manejadorAlarmas.escribirAlarmasMedicion(clima.getIdZona(), clima.getTemperatura());
            System.out.println("Nº Zona"+clima.getIdZona()+" temperatura "+clima.getTemperatura());
        }
    }

    private ArrayList vincularClimas() {
        ArrayList zonas = gestorZona.getZonas();
        ArrayList climasXZonas = new ArrayList();
        System.out.print("Vinculando clima:");
        for (int i = 0; i < zonas.size(); i++) {
            Zona zona = (Zona) zonas.get(i);
            //Clima clima = new Clima ();
            Clima climaRef = (Clima) climas.get(zona.getIdLocalidad());
            //Si no hay datod actuales del clima no agregarlos
            if (climaRef != null) {
                Clima clima = (Clima) climaRef.clone();
                clima.setIdZona(zona.getIdZona());
                climasXZonas.add(clima);
                System.out.print(".");
            }
         }
        return climasXZonas;
    }
}
