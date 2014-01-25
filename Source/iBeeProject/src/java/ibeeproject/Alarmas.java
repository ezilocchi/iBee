/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ibeeproject;

import com.sun.rave.web.ui.appbase.AbstractPageBean;
import ibeeproject.model.persona.Cargo;
import ibeeproject.model.zona.Periodicidad;
import ibeeproject.model.zona.TipoAlarma;
import ibeeproject.model.zona.Zona;
import ibeeproject.persistencia.GestorCargo;
import ibeeproject.persistencia.GestorPeriodicidad;
import ibeeproject.persistencia.GestorTipoAlarma;
import ibeeproject.persistencia.GestorZona;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.FacesException;
import javax.faces.model.SelectItem;

/**
 * <p>Page bean that corresponds to a similarly named JSP page.  This
 * class contains component definitions (and initialization code) for
 * all components that you have defined on this page, as well as
 * lifecycle methods and event handlers where you may add behavior
 * to respond to incoming events.</p>
 *
 * @version Alarmas.java
 * @version Created on 12-ene-2010, 21:32:03
 * @author carranza.matias
 */
public class Alarmas extends AbstractPageBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">

    private int __placeholder;
    private boolean consultarAll = true;
    private boolean consultar = false;
    private boolean modificar = false;
    private boolean agregar = false;
    private boolean eliminar = false;
    private ArrayList<SelectItem> tipoAlarmas = new ArrayList();
    private ArrayList<SelectItem> periodicidades = new ArrayList();
    private ArrayList<SelectItem> zonas = new ArrayList();
    private ArrayList<SelectItem> cargos = new ArrayList();

    /**
     * <p>Automatically managed component initialization.  <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
    }

    // </editor-fold>
    /**
     * <p>Construct a new Page bean instance.</p>
     */
    public Alarmas() {
    }

    /**
     * <p>Callback method that is called whenever a page is navigated to,
     * either directly via a URL, or indirectly via page navigation.
     * Customize this method to acquire resources that will be needed
     * for event handlers and lifecycle methods, whether or not this
     * page is performing post back processing.</p>
     * 
     * <p>Note that, if the current request is a postback, the property
     * values of the components do <strong>not</strong> represent any
     * values submitted with this request.  Instead, they represent the
     * property values that were saved for this view when it was rendered.</p>
     */
    @Override
    public void init() {
        // Perform initializations inherited from our superclass
        super.init();
        // Perform application initialization that must complete
        // *before* managed components are initialized
        // TODO - add your own initialiation code here

        // <editor-fold defaultstate="collapsed" desc="Managed Component Initialization">
        // Initialize automatically managed components
        // *Note* - this logic should NOT be modified
        try {
            _init();
        } catch (Exception e) {
            log("Alarmas Initialization Failure", e);
            throw e instanceof FacesException ? (FacesException) e : new FacesException(e);
        }

    // </editor-fold>
    // Perform application initialization that must complete
    // *after* managed components are initialized
    // TODO - add your own initialization code here
        this.vaciarArrays();
        this.getDBTipoAlarmas();
        this.getDBPeriodicidades();
        this.getDBZonas();
        this.getDBCargos();

    }

    /**
     * <p>Callback method that is called after the component tree has been
     * restored, but before any event processing takes place.  This method
     * will <strong>only</strong> be called on a postback request that
     * is processing a form submit.  Customize this method to allocate
     * resources that will be required in your event handlers.</p>
     */
    @Override
    public void preprocess() {
    }

    /**
     * <p>Callback method that is called just before rendering takes place.
     * This method will <strong>only</strong> be called for the page that
     * will actually be rendered (and not, for example, on a page that
     * handled a postback and then navigated to a different page).  Customize
     * this method to allocate resources that will be required for rendering
     * this page.</p>
     */
    @Override
    public void prerender() {
    }

    /**
     * <p>Callback method that is called after rendering is completed for
     * this request, if <code>init()</code> was called (regardless of whether
     * or not this was the page that was actually rendered).  Customize this
     * method to release resources acquired in the <code>init()</code>,
     * <code>preprocess()</code>, or <code>prerender()</code> methods (or
     * acquired during execution of an event handler).</p>
     */
    @Override
    public void destroy() {
    }

    public boolean isConsultarAll() {
        return consultarAll;
    }

    public void setConsultarAll(boolean consultarAll) {
        this.consultarAll = consultarAll;
        this.consultar = false;
        this.agregar = false;
        this.eliminar = false;
        this.modificar = false;
    }

    /**
     * @return the consultar
     */
    public boolean isConsultar() {
        return consultar;
    }

    /**
     * @param consultar the consultar to set
     */
    public void setConsultar(boolean consultar) {
        this.consultar = consultar;
        this.consultarAll = false;
        this.agregar = false;
        this.eliminar = false;
        this.modificar = false;
    }

    /**
     * @return the modificar
     */
    public boolean isModificar() {
        return modificar;
    }

    /**
     * @param modificar the modificar to set
     */
    public void setModificar(boolean modificar) {
        this.modificar = modificar;
        this.consultar = false;
        this.consultarAll = false;
        this.agregar = false;
        this.eliminar = false;
    }

    /**
     * @return the agregar
     */
    public boolean isAgregar() {
        return agregar;
    }

    /**
     * @param agregar the agregar to set
     */
    public void setAgregar(boolean agregar) {
        this.agregar = agregar;
        this.consultar = false;
        this.consultarAll = false;
        this.eliminar = false;
        this.modificar = false;
    }

    /**
     * @return the eliminar
     */
    public boolean isEliminar() {
        return eliminar;
    }

    /**
     * @param eliminar the eliminar to set
     */
    public void setEliminar(boolean eliminar) {
        this.eliminar = eliminar;
        this.consultar = false;
        this.consultarAll = false;
        this.agregar = false;
        this.modificar = false;
    }

    /**
     * @return the tipoAlarmas
     */
    public ArrayList<SelectItem> getTipoAlarmas() {
        return tipoAlarmas;
    }

    /**
     * @param tipoAlarmas the tipoAlarmas to set
     */
    public void setTipoAlarmas(ArrayList<SelectItem> tipos) {
        this.setTipoAlarmas(tipos);
    }

    /**
     * @return the periodicidades
     */
    public ArrayList<SelectItem> getPeriodicidades() {
        return periodicidades;
    }

    /**
     * @param periodicidades the periodicidades to set
     */
    public void setPeriodicidades(ArrayList<SelectItem> periodicidades) {
        this.setPeriodicidades(periodicidades);
    }

    /**
     * Limpia los Arrays de la Página
     */
    public void vaciarArrays() {
        this.getPeriodicidades().clear();
        this.getTipoAlarmas().clear();
        this.getZonas().clear();
        this.getCargos().clear();
    }

    /**
     * Setea inicialmente las Periodicidades
     */
    public void getDBPeriodicidades() {
        Periodicidad periodicidad = new Periodicidad();
        GestorPeriodicidad gestor = new GestorPeriodicidad();
        ArrayList periodic = gestor.getTodos();
        for (int i = 0; i < periodic.size(); i++) {
            periodicidad = (Periodicidad) periodic.get(i);
            this.getPeriodicidades().add(new SelectItem(periodicidad.getNumero(), periodicidad.getDenominacion()));
        }
    }

    /**
     * Setea inicialmente los Tipos de Alarma
     */
    public void getDBTipoAlarmas() {
        GestorTipoAlarma gestor = new GestorTipoAlarma();
        TipoAlarma tipoAlarma = new TipoAlarma();
        ArrayList tipos = gestor.getTodos();
        for (int i = 0; i < tipos.size(); i++) {
            tipoAlarma = (TipoAlarma) tipos.get(i);
            this.getTipoAlarmas().add(new SelectItem(tipoAlarma.getNumero(), tipoAlarma.getDenominacion()));
        }
    }

    /**
     * Setea inicialmente las Zonas
     */
    public void getDBZonas() {
        GestorZona gestor = new GestorZona();
        Zona zona = new Zona();
        ArrayList zs = gestor.getTodos();
        for (int i = 0; i < zs.size(); i++) {
            zona = (Zona) zs.get(i);
            this.getZonas().add(new SelectItem(zona.getIdZona(), zona.getZona()));
        }
    }

    /**
     * Setea inicialmente las Cargos
     */
    public void getDBCargos() {
        GestorCargo gestor = new GestorCargo();
        Cargo cargo= new Cargo();
        ArrayList cs = gestor.getTodos();
        for (int i = 0; i < cs.size(); i++) {
            cargo = (Cargo) cs.get(i);
            this.getCargos().add(new SelectItem(cargo.getIdCargo(), cargo.getDescripcion() + " [" + cargo.getDenominacion() + "]"));
        }
    }

    /**
     * @return the zonas
     */
    public ArrayList<SelectItem> getZonas() {
        return zonas;
    }

    /**
     * @param zonas the zonas to set
     */
    public void setZonas(ArrayList<SelectItem> zonas) {
        this.zonas = zonas;
    }

    /**
     * @return the cargos
     */
    public ArrayList<SelectItem> getCargos() {
        return cargos;
    }

    /**
     * @param cargos the cargos to set
     */
    public void setCargos(ArrayList<SelectItem> cargos) {
        this.cargos = cargos;
    }
}

