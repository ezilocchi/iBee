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
 * @author soria.federico
 */
public class LectorTempActualXml {
    private Document doc;
    private Localidad localidad;

    public LectorTempActualXml(Document document) {
        doc = document;
    }

    public Localidad getLocalidad () {
        localidad = new Localidad();
        try {
            NodeList elements = doc.getElementsByTagName("loc");
            Element element = (Element) elements.item(0);
            String codigo = element.getAttributeNode("id").getValue();
            localidad.setIdLocalidad(codigo);
            localidad.setTemperatura(new Double(doc.getElementsByTagName("tmp").item(0).getFirstChild().getNodeValue()));
            localidad.setIconoTemperatura(new Integer (doc.getElementsByTagName("icon").item(0).getFirstChild().getNodeValue()));
        } catch (NullPointerException ex) {
            //no recibo temperatura actual
            System.out.println("No devuelve datos actuales del clima de: " + doc.getElementsByTagName("dnam").item(0).getFirstChild().getNodeValue());
            localidad.setIdLocalidad("NoData");
            ex.printStackTrace();
        }
        return localidad;
    }

}
