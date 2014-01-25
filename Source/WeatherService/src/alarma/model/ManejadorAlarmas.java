/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package alarma.model;

import alarma.Alarma;
import alarma.Criticidad;
import alarma.HistorialAlarma;
import controller.alarma.GestorAlarma;
import controller.alarma.GestorHistorialAlarma;
import jMail.Mail;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author carranza.matias
 */
public class ManejadorAlarmas {

    private ArrayList alarmas;

    /**
     * @return the alarmas
     */
    public ArrayList getAlarmas() {
        return alarmas;
    }

    /**
     * @param alarmas the alarmas to set
     */
    public void setAlarmas(ArrayList alarmas) {
        this.alarmas = alarmas;
    }

    public void escribirAlarmasMedicion(int idZona, double temperatura) {
        try{
        GestorAlarma gestorAlarma = new GestorAlarma();
        GestorHistorialAlarma gestorHistorialAlarma = new GestorHistorialAlarma();
        setAlarmas(gestorAlarma.getAlarmasMedicion(idZona, temperatura));
        Alarma alarma;
        HistorialAlarma historialAlarma;
        HistorialAlarma ultimo;
        Mail mail;
        ArrayList <String> emails;
        for (int i = 0; i < alarmas.size(); i++) {
            alarma = (Alarma) alarmas.get(i);
            ultimo = (HistorialAlarma) gestorHistorialAlarma.getUltimo();
            historialAlarma = new HistorialAlarma();
            historialAlarma.setIdAlarma(alarma.getNumero());
            historialAlarma.setNumero(ultimo.getNumero() + 1);
            historialAlarma.setFecha(new Date());
            historialAlarma.setValor(temperatura);
            historialAlarma.setAcciones(false);
            Criticidad criticidad = alarma.getProximaCriticidad();
            historialAlarma.setCriticidad(criticidad);
            gestorHistorialAlarma.insertUno(historialAlarma);
            emails = gestorAlarma.getMails(alarma.getIdCargo());
            String mensaje = new String();
            mensaje = "Alarma: " + alarma.getDenominacion() + " en estado: " + alarma.getCriticidad() + " ";
//             historialAlarma.getFecha().toString()
            gestorAlarma.setMensaje(alarma.getNumero(), mensaje, historialAlarma.getFecha());
            // emails: listado de los emails de los empleados con este cargo, tengo que mandarles un mail a cada uno de ellos
            for (int j = 0; j < emails.size(); j++) {
                if (historialAlarma.getCriticidad().getNumero() == 3) {
                    mail = new Mail();
                    // aca tengo que ir a buscar el email del cargo para esta alarma
                    mail.setTo(emails.get(j));
                    mensaje = "La Alarma: " + alarma.getDenominacion() + " (número " + alarma.getNumero() + ") en estado Crítico.";
                    mensaje = mensaje + "\n\nFecha de medición: " + historialAlarma.getFecha().toString();
                    mensaje = mensaje + "\n\n\nSe ha registrado un valor de " + historialAlarma.getValor() + "º el cual esta fuera de los límites aceptables para esta alarma.";
                    mensaje = mensaje + "\nDebe realizar alguna acción para resolver esta alarma, para esto puede generar una nueva tarea en el sistema y una vez solucionada la tarea, la alarma estará solucionada.";
                    mensaje = mensaje + "\n\n\n\n\n------------------\nMensaje enviado automaticamente por iBee ©2009-2010.";
                    mail.setMessage(mensaje);
                    mail.setSubject("Alarma: " + alarma.getDenominacion() + " en estado Crítico - iBee");
                    String to = mail.getTo();
                    int result;
                    result = mail.sendMail();

                    try {
                        // Create file
                        FileWriter fstream = new FileWriter("alarmas_log.txt", true);
                        BufferedWriter out = new BufferedWriter(fstream);
                        if (result == 0) {
                            out.write(historialAlarma.getFecha().toString() + ", Alarma: " + alarma.getNumero() + ", Medicion: " + historialAlarma.getNumero() + " , Mail Successfully Sent to: " + to);
                            out.newLine();
                        } else {
                            out.write(historialAlarma.getFecha().toString() + ", Alarma: " + alarma.getNumero() + ", Medicion: " + historialAlarma.getNumero() + ", Mail NOT Sent to: " + to);
                            out.newLine();
                        }

                        //Close the output stream
                        out.close();
                    } catch (Exception e) {//Catch exception if any
//                        System.err.println("Error: " + e.getMessage());
                    }
                }
            }
        }
        }catch(Exception a){}
    }
}
