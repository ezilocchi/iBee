/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.util.Date;
import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

/**
 *
 * @author moris
 */
public class LectorWeatherXml {

//    private String path="D:/Fedito/NB_pruebas/WebServices/ARCA0026-m.xml";
	private Document doc;
    private Clima clima;

    public LectorWeatherXml(Document document) {
        doc = document;
//        try {
//            doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(path);
//        } catch (ParserConfigurationException ex) {
//            ex.printStackTrace();
//        } catch (SAXException ex) {
//            ex.printStackTrace();
//        } catch (IOException ex) {
//            ex.printStackTrace();
//        }
    }

    public Clima getClima () {
        clima = new Clima();
        try {
            //ver como manejar los id
//            Element node = (Element) doc.getElementsByTagName("loc").item(0);
//            System.out.println(node.getAttributeNode("id").getValue());
            clima.setFechaHora(new Date());
            clima.setSalidaDelSol(doc.getElementsByTagName("sunr").item(0).getFirstChild().getNodeValue());
            clima.setPuestaDelSol(doc.getElementsByTagName("suns").item(0).getFirstChild().getNodeValue());
            clima.setTemperatura(new Double(doc.getElementsByTagName("tmp").item(0).getFirstChild().getNodeValue()));
            clima.setIconoTemperatura(new Integer (doc.getElementsByTagName("icon").item(0).getFirstChild().getNodeValue()));
            clima.setSensacionTermica(new Double(doc.getElementsByTagName("flik").item(0).getFirstChild().getNodeValue()));
            clima.setDescripcionTemperatura(doc.getElementsByTagName("t").item(4).getFirstChild().getNodeValue());
            clima.setPresion(new Double(doc.getElementsByTagName("r").item(0).getFirstChild().getNodeValue()));
            if (doc.getElementsByTagName("s").item(0).getFirstChild().getNodeValue().toString().equals("calm")) {
                clima.setVelocidadDelViento(0);
            } else {
            clima.setVelocidadDelViento(new Double(doc.getElementsByTagName("s").item(0).getFirstChild().getNodeValue()));
            }
            clima.setDireccionDelViento(doc.getElementsByTagName("t").item(5).getFirstChild().getNodeValue());
            clima.setHumedad(new Double(doc.getElementsByTagName("hmid").item(0).getFirstChild().getNodeValue()));
//            clima.setIndiceUV(new Double(doc.getElementsByTagName("i").item(0).getFirstChild().getNodeValue()));
            clima.setFaseLuna(doc.getElementsByTagName("t").item(7).getFirstChild().getNodeValue());
            clima.setIconoLuna(new Integer(doc.getElementsByTagName("icon").item(1).getFirstChild().getNodeValue()));
        } catch (NullPointerException ex) {
            //System.out.println("No devuelve datos actuales del clima de: " + doc.getElementsByTagName("dnam").item(0).getFirstChild().getNodeValue());
//            clima.setIdZona(-1);
//            ex.printStackTrace();
        }
         catch (Exception e) {
//            System.out.println("No devuelve datos actuales del clima de: " + doc.getElementsByTagName("dnam").item(0).getFirstChild().getNodeValue());
//            clima.setIdZona(-1);
//            e.printStackTrace();
        }
        return clima;
    }

//    public void getNombre () {
//        Element element=(Element) doc.getElementsByTagName("loc").item(0);
//        System.out.println(element.getAttributeNode("id").getValue());
//        NodeList nl = doc.getElementsByTagName("s");
//        System.out.println(nl.getLength()+"tamaño");
//        for (int i=0; i<nl.getLength(); i++) {
//            System.out.println(nl.item(i).getFirstChild().getNodeValue());
//        }
//        Date fecha = new Date(83,11,26,15,30,22);
//        SimpleDateFormat formatFecha = new SimpleDateFormat("dd/MM/yyyy"); //fecha
//        SimpleDateFormat formatHora = new SimpleDateFormat("H:mm:ss"); //hora
//    	String cadenaFecha = formatFecha.format(fecha);
//        String cadenaHora = formatHora.format(fecha);
//        System.out.println(cadenaFecha);
//        System.out.println(cadenaHora);
//        System.out.println(Calendar.getInstance().toString()+"\n");
//
//    }
//
//    public void verClima () {
//        System.out.println(clima.mostrarFecha());
//        System.out.println(clima.mostrarHora());
//        System.out.println(clima.getSalidaDelSol());
//        System.out.println(clima.getPuestaDelSol());
//        System.out.println(clima.getTemperatura());
//        System.out.println(clima.getIconoTemperatura());
//        System.out.println(clima.getSensacionTermica());
//        System.out.println(clima.getDescripcionTemperatura());
//        System.out.println(clima.getPresion());
//        System.out.println(clima.getVelocidadDelViento());
//        System.out.println(clima.getDireccionDelViento());
//        System.out.println(clima.getHumedad());
//        System.out.println(clima.getIndiceUV());
//        System.out.println(clima.getFaseLuna());
//        System.out.println(clima.getIconoLuna());
//    }

}
