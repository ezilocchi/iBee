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
public class LectorLocXml {

    private String path="D:/Fedito/NB_pruebas/WebServices/search.xml";
	private Document doc;
    private String locName;

    public LectorLocXml(Document document, String loc) {
//        try {
//            doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(path);
//        } catch (ParserConfigurationException ex) {
//            ex.printStackTrace();
//        } catch (SAXException ex) {
//            ex.printStackTrace();
//        } catch (IOException ex) {
//            ex.printStackTrace();
//        }
        doc = document;
        locName = loc;
    }

    public Localidad addLocId () {
        Localidad localidad = new Localidad ();
        NodeList elements = doc.getElementsByTagName("loc");
//        if (elements.getLength() == 0) {
//        }
        for (int i=0; i<elements.getLength(); i++) {
            Element element = (Element) elements.item(i);
            String codigo = element.getAttributeNode("id").getValue();
            //System.out.println(codigo); //ver
            if ("ARCA".equals(codigo.substring(0, 4))) {
                localidad.setIdLocalidad(codigo);
                localidad.setNombre(locName);
                break;
            }
        }
        return localidad;
    }

    public void getlocs () {
        Localidad loc = addLocId();
        System.out.println("\n" + loc.getIdLocalidad());
        System.out.println(loc.getNombre());
    }

}
