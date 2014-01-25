<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Document   : Home
    Created on : 27-jun-2009, 15:52:05
    Author     : farias.facundo
-->

<jsp:root version="2.1" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:ice="http://www.icesoft.com/icefaces/component" 
          xmlns:jsp="http://java.sun.com/JSP/Page" >
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <html id="outputHtml1">
            <!-- Encabezado -->
            <head id="outputHead1">
                <jsp:directive.include file="./styles.jspf" />
                <title>iBee Project</title>

            </head>

            <!-- Cuerpo -->

            <body id="outputBody1" style="-rave-layout: grid">
                <ice:form id="hdr" style="top:6%; left:1%; right:1%; position:absolute">
                    <jsp:directive.include file="./Header.jspf"/>
                </ice:form>
                <jsp:directive.include file="./cabecera.jspf"/>

                <!-- Mapa (Panel Izquierdo) -->
                <ice:panelGrid cellspacing="0px" columnClasses="columna1, columna2" columns="1" styleClass="tablaPrincipal">


                    <!-- Fragment correspondiente a las accion General -->
                    <ice:form id="foot">
                        <table style="height: 400px; width:100%">
                            <tr>
                                <td width="50%" style="vertical-align: top;">
                                    <ice:panelSeries var="panel" value="#{Home.lista}" >
                                        <ice:panelGrid style="border: 1px solid gray;margin: 2px;" width="100%;">
                                            <ice:panelCollapsible value="#{panel.name}" styleClass="o_folding_panel" expanded="true" >
                                                <f:facet name="header" >
                                                    <ice:panelGroup >
                                                        <ice:outputText id="formHeaderHome" value="#{panel.name}"  style="font-size: 14px;"/>
                                                    </ice:panelGroup>
                                                </f:facet>
                                                <ice:panelSeries value="#{panel.detalle}" var="detalle" >
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <ice:graphicImage value="#{detalle['icon']}" />
                                                            </td>
                                                            <td>
                                                                <ice:outputText value="#{detalle['fecha']}" />
                                                            </td>
                                                            <td>
                                                                <ice:outputText value="#{detalle['title']}" style="font-weight:bolder;color:#005FA9;" />
                                                            </td>
                                                            <td>
                                                                <ice:outputText value="#{detalle['detail']}" style="font: grey;"/>
                                                            </td>
                                                            <td>
                                                                <ice:commandLink value="Ver más" styleClass="homeLinks" action="#{Home.ir}" style="float:right;" rendered="#{detalle['render']}" >
                                                                    <f:param name="navegacion" value="#{detalle['action']}" binding="#{Home.parametro}"/>
                                                                </ice:commandLink>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ice:panelSeries>
                                            </ice:panelCollapsible>
                                        </ice:panelGrid>
                                    </ice:panelSeries>
                                </td>
                                <td width="50%" style="vertical-align: top;">
                                    <ice:panelSeries var="panel_izq" value="#{Home.lista_izq}" >
                                        <ice:panelGrid style="border: 1px solid gray;margin: 2px;" width="100%;" >
                                            <ice:panelCollapsible value="#{panel_izq.name}" styleClass="o_folding_panel" expanded="true" >
                                                <f:facet name="header" >
                                                    <ice:panelGroup >
                                                        <ice:outputText id="formHeaderHome_izq" value="#{panel_izq.name}" style="font-size: 14px;"/>
                                                    </ice:panelGroup>
                                                </f:facet>
                                                <ice:panelSeries value="#{panel_izq.detalle}" var="detalle" >
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <ice:graphicImage value="#{detalle['icon']}" />
                                                            </td>
                                                            <td>
                                                                <ice:outputText value="#{detalle['fecha']}"/>
                                                            </td>
                                                            <td>
                                                                <ice:outputText value="#{detalle['title']}" style="font-weight:bolder;color:#005FA9;" />
                                                            </td>
                                                            <td>
                                                                <ice:outputText value="#{detalle['detail']}" style="font: grey;"/>
                                                            </td>
                                                            <td>
                                                                <ice:commandLink value="Ver más" styleClass="homeLinks" action="#{Home.ir}" style="float:right;" rendered="#{detalle['render']}" >
                                                                    <f:param name="navegacion_izq" value="#{detalle['action']}" binding="#{Home.parametro}"/>
                                                                </ice:commandLink>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ice:panelSeries>
                                            </ice:panelCollapsible>
                                        </ice:panelGrid>
                                    </ice:panelSeries>
                        </td></tr></table>
                    </ice:form>
                </ice:panelGrid>

                <!-- Pie de Pagina -->
                <div>
                    <ice:panelGrid id="bottom" style="position:relative;border-style: solid;border-width: 1px; border-color: #EEEEEE; left:1%" width="98%;">
                        <jsp:directive.include file="./pieDePagina.jspf"/>
                    </ice:panelGrid>
                </div>

                <!-- Ventana Popup (Reutilizable) -->
                <jsp:directive.include file="ModalPopup.jspf"/>

            </body>
        </html>
    </f:view>
</jsp:root>
