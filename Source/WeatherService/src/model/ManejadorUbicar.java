/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import controller.GestorLocalidad;
import java.util.ArrayList;
import org.w3c.dom.Document;

/**
 *
 * @author soriagal
 */
public class ManejadorUbicar {
    private WebUbicar webUbicar;
    private GestorLocalidad gestorLocalidad = new GestorLocalidad();
    private ArrayList idLocalidades;
    private ArrayList documents; //object: document con el xml
    private ArrayList localidades = new ArrayList(); //object: objeto localidad

    public void pedirUbicacion () {
        idLocalidades = gestorLocalidad.getLocalidades();
        webUbicar = new WebUbicar();
        documents = webUbicar.getDocuments(idLocalidades);
        for (int i=0; i<documents.size(); i++) {
            Localidad localidad;
            LectorUbicacionXml lector = new LectorUbicacionXml((Document) documents.get(i));
            localidad = lector.getLocalidad();
            localidades.add(localidad);
        }
    }

    public void guardarUbicacion () {
        for (int i=0; i<localidades.size(); i++) {
            Localidad localidad = (Localidad) localidades.get(i);
            gestorLocalidad.guardarUbicacion(localidad);
        }
    }

}
