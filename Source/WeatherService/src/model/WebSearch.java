/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.RandomAccessFile;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Document;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

/**
 *
 * @author soria.federico
 */
public class WebSearch {

    private static final String BEGIN_URL = "http://xoap.weather.com/search/search?where=";
    private String path = "./Resources/ciudades.txt";//ver de q el path sea relativo
    //private String localidad;
    private File archivo;
    private ArrayList nombresLocalidades = new ArrayList();

    public WebSearch() {
        archivo = new File (path);
    }

    /**
     * Devuelve un HashMap con la key=nombreLocalidad y el
     * object=document con los datos del xml de busqueda del codigo de esa localidad
     * @return
     */
    public HashMap getDocuments () {
        HashMap documents = new HashMap();
        Document document = null;
        try {
            RandomAccessFile localidades = new RandomAccessFile(archivo, "r");
            while (localidades.getFilePointer()<localidades.length()) {
                String nombreLocalidad = localidades.readLine();
                String url = formarURL(nombreLocalidad);
                document = peticion(url);
                documents.put(nombreLocalidad, document);
                nombresLocalidades.add(nombreLocalidad);
            }
        } catch (FileNotFoundException ex) {
            ex.printStackTrace();
        } catch (IOException ex) {
            ex.printStackTrace();
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

    private String formarURL(String nombreLoc) {
        String url = "";
        try {
            url = BEGIN_URL + URLEncoder.encode(nombreLoc, "UTF-8");
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(WebSearch.class.getName()).log(Level.SEVERE, null, ex);
        }
        return url;
    }

    public ArrayList getNombresLocalidades() {
        return nombresLocalidades;
    }

}
