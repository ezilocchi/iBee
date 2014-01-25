<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Document   : Monitoreo
    Created on : 12-oct-2009, 19:41:38
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
                <f:verbatim>
                    <![CDATA[
                    <script type="text/javascript" src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAbSzQ9VpZQwenDnv2GOzjYBS0mfbAkUOhKCwVmgIpLk6yLG9CCBReWtkTVanbYdV5orUhEeUGOvaLsA">
                    </script>
                    ]]>
                </f:verbatim>
            </head>

            <!-- Cuerpo -->

            <body id="outputBody1" style="-rave-layout: grid">
                <ice:form id="hdr" style="top:6%; left:1%; right:1%; position:absolute">
                    <jsp:directive.include file="./Header.jspf"/>
                </ice:form>
                <jsp:directive.include file="./cabecera.jspf"/>

                <!-- Mapa (Panel Izquierdo) -->
                <ice:panelGrid cellspacing="0px" columnClasses="columna1, columna2" columns="2" styleClass="tablaPrincipal">
                    <ice:form id="body">
                        <ice:panelGroup style="vertical-align: top;" >
                            <ice:panelCollapsible id="Mapa" expanded="true" toggleOnClick="false">
                                <f:facet name="header">
                                    <ice:panelGroup>
                                        <ice:outputText id="formHeaderMap" value="Mapa"/>
                                    </ice:panelGroup>
                                </f:facet>
                                <jsp:directive.include file="./googleMap.jspf"/>
                            </ice:panelCollapsible>
                        </ice:panelGroup>
                    </ice:form>

                    <!-- Fragment correspondiente a las accion General -->
                    <ice:form id="chart">
                        <ice:panelCollapsible id="Monitoreo" expanded="true">
                            <f:facet name="header">
                                <ice:panelGroup>
                                    <ice:outputText id="formHeaderMonitoreo" value="Monitoreo"/>
                                </ice:panelGroup>
                            </f:facet>
                            <ice:panelGrid>
                                <ice:column>
                                    <ice:outputLabel value="Seleccione los apiares a comparar: "/>
                                    <ice:selectOneMenu value="#{Monitoreo.idApiar1}" id="selApiar1" styleClass="abmInput"
                                                       required="true" partialSubmit="true">
                                        <f:selectItems value="#{Monitoreo.apiares}" />
                                    </ice:selectOneMenu>
                                    <ice:selectOneMenu value="#{Monitoreo.idApiar2}" id="selApiar2" styleClass="abmInput"
                                                       required="true"  partialSubmit="true">
                                        <f:selectItems value="#{Monitoreo.apiares}" />
                                    </ice:selectOneMenu>
                                    <ice:selectOneMenu value="#{Monitoreo.idApiar3}" id="selApiar3" styleClass="abmInput"
                                                       required="true"  partialSubmit="true">
                                        <f:selectItems value="#{Monitoreo.apiares}" />
                                    </ice:selectOneMenu>
                                </ice:column>
                                <ice:column>
                                    <ice:outputLabel value="Seleccione una variable: "/>
                                    <ice:selectOneMenu value="#{Monitoreo.var}" id="selVar" styleClass="abmInput"
                                                       required="true"  partialSubmit="true">
                                        <f:selectItems value="#{Monitoreo.wheaterVar}"/>
                                    </ice:selectOneMenu>
                                </ice:column>
                                <ice:column>
                                    <ice:commandButton styleClass="buttonGraph" value="Actualizar Grafico" action="#{Monitoreo.updateGraph}"/>
                                </ice:column>
                            </ice:panelGrid>
                            <ice:outputChart id="axisOutputChart"
                                             type="#{axisChartBean.type}"
                                             chartTitle=" Grafico de Clima por Apiar"
                                             yaxisTitle="#{Monitoreo.wheaterVar[Monitoreo.var-1].label}"
                                             xaxisTitle="#{axisChartBean.titleX}"
                                             xaxisLabels="#{Monitoreo.util.labels}"
                                             labels="#{Monitoreo.util.legendLabels}"
                                             colors="#{axisChartBean.paints}"
                                             data="#{Monitoreo.util.data}"
                                             actionListener="#{axisChartBean.imageClicked}"
                                             renderOnSubmit="#{axisChartBean.newChart}"
                                             horizontal="#{axisChartBean.horizontal}"
                                             width="750" height="350"
                                             rendered="#{Monitoreo.mostrar}"/>
                        </ice:panelCollapsible>
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