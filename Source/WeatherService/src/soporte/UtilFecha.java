/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package soporte;

import java.util.Date;

/**
 *
 * @author Fede 
 */
public class UtilFecha {

    /**
     * convierte un atributo tipo java.sql.Date a un atributo tipo java.util.Date
     * @param sqlFecha
     * @return
     */
    public static Date convertiFecha (java.sql.Date sqlFecha)
	{
		long fecha=sqlFecha.getTime();
		Date utilFecha=new Date(fecha);
		return utilFecha;
	}

	/**
     * convierte un atributo tipo java.util.Date a un atributo tipo java.sql.Date
     * @param utilFecha
     * @return
     */
    public static java.sql.Date convertiFecha (Date utilFecha)
	{
		long fecha=utilFecha.getTime();
		java.sql.Date sqlFecha=new java.sql.Date(fecha);
		return sqlFecha;
	}

}
