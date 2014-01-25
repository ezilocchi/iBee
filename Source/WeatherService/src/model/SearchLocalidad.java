/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import controller.GestorLocalidad;
import java.util.ArrayList;
import java.util.HashMap;
import org.w3c.dom.Document;

/**
 *
 * @author soria.federico
 */
public class SearchLocalidad {

    private WebSearch webSearch;
    private HashMap documents; //key: nombreLocalidades, object: document con el xml
    private ArrayList nombreLocalidades;
    private ArrayList localidades = new ArrayList(); //objetos localidad soportadas

    public void search () {
        webSearch = new WebSearch();
        documents = webSearch.getDocuments();
        nombreLocalidades = webSearch.getNombresLocalidades();
        for (int i=0; i<documents.size(); i++) {
            Localidad localidad;
            LectorLocXml lector = new LectorLocXml((Document) documents.get(nombreLocalidades.get(i)), String.valueOf(nombreLocalidades.get(i)));
            localidad = lector.addLocId();
            if (localidad.getIdLocalidad()!= null) {
                localidades.add(localidad);
            }
        }
    }

    public void guardarLocalidades () {
        GestorLocalidad gestor = new GestorLocalidad();
        for (int i=0; i<localidades.size(); i++) {
            Localidad localidad = (Localidad) localidades.get(i);
            gestor.insertar(localidad);
        }
    }

    public void borrarLocalidades () {
        GestorLocalidad gestor = new GestorLocalidad();
        gestor.borrarLocalidades();
    }

}
