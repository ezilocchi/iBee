/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Document;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

/**
 *
 * @author soria.federico
 */
public class WebWeather {

    private static final String BEGIN_URL = "http://xoap.weather.com/weather/local/";
    private static final String END_URL = "?cc=*&unit=m&dayf=5&link=xoap&prod=xoap&par=1108614522&key=930d79031b71e9b4";

    /**
     * Devuelve un HashMap con la key=idLocalidad y el
     * object=document con los datos del xml del clima de esa localidad
     * @param loc
     * @return
     */
    public HashMap getDocuments (ArrayList loc) {
        ArrayList localidades = loc;
        HashMap documents=new HashMap();
        String url;
        System.out.println("Conectando a:"+'\n'+BEGIN_URL);
        for (int i=0; i<localidades.size(); i++) {
            url = formarURL(String.valueOf(localidades.get(i)));
            documents.put(localidades.get(i), peticion(url));
        }
        return documents;
    }

    private Document peticion(String urlString) {
        Document document = null;

        try {
              // URL del tiempo
              URL url = new URL(urlString);

              // Buffer con los datos recibidos
              BufferedReader in = null;

              try {
                // Volcamos lo recibido al buffer
                in = new BufferedReader(new InputStreamReader(
                   url.openStream()));
              } catch(Throwable t){
                  t.printStackTrace();
              }

              // Transformamos el contenido del buffer a texto
              String inputLine;
              String inputText="";

              // Mientras haya cosas en el buffer las volcamos a las
              // cadenas de texto
              while ((inputLine = in.readLine()) != null)
              {
                inputText = inputText + inputLine;
              }

              // Mostramos el contenido y cerramos la entrada
              //System.out.println("El contenido de la URL es: " + inputText);

              try {
                    //parsear el contenido de String a Document
                    document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(new InputSource(new StringReader(inputText)));
                  } catch (SAXException ex) {
                    ex.printStackTrace();
                  } catch (ParserConfigurationException ex) {
                    ex.printStackTrace();
                  }

              //Cerrar BuefferedReader
              in.close();

            } catch (MalformedURLException me) {
              System.out.println("URL erronea");
            } catch (IOException ioe) {
              System.out.println("Error IO");
              ioe.printStackTrace();
            }
        return document;
    }

    private String formarURL(String idLoc) {
        String url = BEGIN_URL + idLoc + END_URL;
        return url;
    }

}
