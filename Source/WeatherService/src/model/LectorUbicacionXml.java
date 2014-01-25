/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

/**
 *
 * @author soriagal
 */
public class LectorUbicacionXml {
    private Document doc;
    private Localidad localidad;

    public LectorUbicacionXml(Document document) {
        doc = document;
    }

    public Localidad getLocalidad () {
        localidad = new Localidad();
        //ver como manejar los id
        NodeList elements = doc.getElementsByTagName("loc");
        Element element = (Element) elements.item(0);
        String codigo = element.getAttributeNode("id").getValue();
        localidad.setIdLocalidad(codigo);
        localidad.setLatitud(new Double (doc.getElementsByTagName("lat").item(0).getFirstChild().getNodeValue()));
        localidad.setLongitud(new Double (doc.getElementsByTagName("lon").item(0).getFirstChild().getNodeValue()));
        return localidad;
    }

}
