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
 * @author soria.federico
 */
public class ManejadorTempActual {
    private WebUbicar webTempActual; //sirve para esta feature
    private GestorLocalidad gestorLocalidad = new GestorLocalidad();
    private ArrayList idLocalidades;
    private ArrayList documents; //object: document con el xml
    private ArrayList localidades = new ArrayList(); //object: objeto localidad

    public void pedirTempActual () {
        idLocalidades = gestorLocalidad.getLocalidades();
        webTempActual = new WebUbicar();
        documents = webTempActual.getDocuments(idLocalidades);
        for (int i=0; i<documents.size(); i++) {
            Localidad localidad;
            LectorTempActualXml lector = new LectorTempActualXml((Document) documents.get(i));
            localidad = lector.getLocalidad();
            if (!localidad.getIdLocalidad().equals("NoData")) {
                localidades.add(localidad);
            } else {
                System.out.println("No se actualizo el clima de esta localidad");
            }
            
        }
    }

    public void guardarTempActual () {
        for (int i=0; i<localidades.size(); i++) {
            Localidad localidad = (Localidad) localidades.get(i);
            gestorLocalidad.guardarTempActual(localidad);
        }
    }

}
