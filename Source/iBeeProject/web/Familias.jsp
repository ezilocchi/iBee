<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Document   : Familias
    Created on : 03-ago-2009, 19:42:05
    Author     : burni.matias
-->

<jsp:root version="2.1" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:ice="http://www.icesoft.com/icefaces/component" xmlns:jsp="http://java.sun.com/JSP/Page">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <html id="Familias">

            <!-- Encabezado -->

            <head id="FamiliasHead1">
                <jsp:directive.include file="styles.jspf"/>

                <title>iBee Project</title>

                <f:verbatim>
                    <![CDATA[
                    <script type="text/javascript" src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAbSzQ9VpZQwenDnv2GOzjYBS0mfbAkUOhKCwVmgIpLk6yLG9CCBReWtkTVanbYdV5orUhEeUGOvaLsA">
                    </script>
                    ]]>
                </f:verbatim>

            </head>

            <!-- Cuerpo -->

            <body id="FamiliasBody1" style="-rave-layout: grid">
                <!-- Menu + Cabecera -->
                <ice:form id="form1" style="top:6%; left:1%; right:1%; position:absolute">
                    <jsp:directive.include file="./Header.jspf"/>
                </ice:form>
                <jsp:directive.include file="cabecera.jspf"/>

                <!-- Mapa (Panel Izquierdo) -->
                <ice:panelGrid cellspacing="0px" columnClasses="columna1, columna2" columns="2" styleClass="tablaPrincipal">
                    <ice:form>
                        <ice:panelGroup style="vertical-align: top;" >
                            <ice:panelCollapsible toggleOnClick="false" expanded="true" id="Mapa">
                                <f:facet name="header">
                                    <ice:panelGroup>
                                        <ice:outputText id="formHeaderMap" value="Mapa"/>
                                    </ice:panelGroup>
                                </f:facet>
                                <jsp:directive.include file="googleMap.jspf"/>
                            </ice:panelCollapsible>
                        </ice:panelGroup>
                    </ice:form>

                    <!-- Fragments correspondientes a las acciones de ABM -->
                    <ice:form rendered="#{Familias.consultar}">
                        <ice:panelCollapsible expanded="true" id="formConsultarPanelFamilias">
                            <f:facet name="header">
                                <ice:panelGroup>
                                    <ice:outputText id="formHeaderFamilias" value="Familias"/>
                                </ice:panelGroup>
                            </f:facet>
                            <ice:panelGroup style="vertical-align: top;">
                                <jsp:directive.include file="consultarFamiliaUna.jspf"/>
                            </ice:panelGroup>
                        </ice:panelCollapsible>
                    </ice:form>
                    <ice:form rendered="#{Familias.agregar}">
                        <ice:panelCollapsible expanded="true" id="formAgregarPanelFamilias">
                            <f:facet name="header">
                                <ice:panelGroup>
                                    <ice:outputText id="formHeaderFamilias" value="Familias"/>
                                </ice:panelGroup>
                            </f:facet>
                            <ice:panelGroup style="vertical-align: top;">
                                <jsp:directive.include file="agregarFamilia.jspf"/>
                            </ice:panelGroup>
                        </ice:panelCollapsible>
                    </ice:form>
                    <ice:form rendered="#{Familias.modificar}">
                        <ice:panelCollapsible expanded="true" id="formModificarPanelFamilias">
                            <f:facet name="header">
                                <ice:panelGroup>
                                    <ice:outputText id="formHeaderFamilias" value="Familias"/>
                                </ice:panelGroup>
                            </f:facet>
                            <ice:panelGroup style="vertical-align: top;">
                                <jsp:directive.include file="modificarFamilia.jspf"/>
                            </ice:panelGroup>
                        </ice:panelCollapsible>
                    </ice:form>
                    <ice:form rendered="#{Familias.eliminar}">
                        <ice:panelCollapsible expanded="true" id="formEliminarPanelFamilias">
                            <f:facet name="header">
                                <ice:panelGroup>
                                    <ice:outputText id="formHeaderFamilias" value="Familias"/>
                                </ice:panelGroup>
                            </f:facet>
                            <ice:panelGroup style="vertical-align: top;">
                                <jsp:directive.include file="eliminarFamilia.jspf"/>
                            </ice:panelGroup>
                        </ice:panelCollapsible>
                    </ice:form>
                    <ice:form rendered="#{Familias.consultarAll}">
                        <ice:panelCollapsible expanded="true" id="formConsultarAllPanelFamilias">
                            <f:facet name="header">
                                <ice:panelGroup>
                                    <ice:outputText id="formHeaderFamilias" value="Familias"/>
                                </ice:panelGroup>
                            </f:facet>
                            <ice:panelGroup style="vertical-align: top;">
                                <jsp:directive.include file="consultarFamilia.jspf"/>
                            </ice:panelGroup>
                        </ice:panelCollapsible>
                    </ice:form>
                </ice:panelGrid>

                <!-- Pie de Pagina -->
                <div>
                    <ice:panelGrid id="bottom" style="position:relative;border-style: solid;border-width: 1px; border-color: #EEEEEE; left:1%" width="98%;">
                        <jsp:directive.include file="pieDePagina.jspf"/>
                    </ice:panelGrid>
                </div>

                <!-- Ventana Popup -->
                <jsp:directive.include file="ModalPopupMiembrosFamilia.jspf"/>
                <jsp:directive.include file="ModalPopupHistorialFamilia.jspf"/>

            </body>
        </html>
    </f:view>
</jsp:root>