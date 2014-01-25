<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Document   : ActualizarClima
    Created on : 21/03/2010, 13:00:15
    Author     : CyberShark
-->
<jsp:root version="2.1" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:ice="http://www.icesoft.com/icefaces/component" xmlns:jsp="http://java.sun.com/JSP/Page">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <html id="outputHtml1">

            <!-- Encabezado -->

            <head id="outputHead1">
                <jsp:directive.include file="styles.jspf"/>

                <title>iBee Project</title>

                <f:verbatim>
                    <![CDATA[
                    <script type="text/javascript" src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAI28BnP5eN_uMUJtjmN0otBSwad-goMde-kcBe1BaaJDaeuqwgxQQk9D9ce_HSjl5k3DQ7UNi_Noo6w">
                    </script>
                    ]]>
                </f:verbatim>

            </head>

            <!-- Cuerpo -->

            <body id="outputBody1" style="-rave-layout: grid">
                <!-- Menu + Cabecera -->
                <ice:form id="form1" style="top:6%; left:1%; right:1%; position:absolute">
                    <jsp:directive.include file="./Header.jspf"/>
                </ice:form>
                <jsp:directive.include file="cabecera.jspf"/>

                <ice:panelGrid cellspacing="0px" columnClasses="columna1" columns="1" styleClass="tablaPrincipal">
                    <ice:column >
                        <ice:form id="body">

                            <ice:panelCollapsible expanded="true" id="formBackupDB"
                                                  style="position:relative;border-style: solid;border-width: 1px; border-color: #EEEEEE; left:1%;width:98%"
                                                  >
                                <f:facet name="header">
                                    <ice:panelGroup>
                                        <ice:outputText id="formHeaderBackupDB" value="Actualizar Clima"/>
                                    </ice:panelGroup>
                                </f:facet>
                                <ice:panelGroup >
                                    <table class="abm" width="100%">

                                        <tr>
                                            <td>
                                                <img src="/iBeeProject/resources/weather_com_logo.jpg" border="0" style="margin: 5px; width: 75px; float: left;" />
                                                <p style="padding-left: 115px;">Para ejecutar manualmente el Servicio de Clima, haga click en Guardar</p>
                                            </td>
                                            <td class="aceptar" style="text-align: left; padding-left: 14px; vertical-align: bottom;">
                                                <ice:commandButton id="aceptar" value="Aceptar" image="/resources/icons/buttons/guardar.png"
                                                                   action="#{ActualizarClima.actualizar}" type="submit"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title"></td>
                                            <td>
                                            </td>
                                            <td class="extension"></td>
                                        </tr>
                                    </table>
                                </ice:panelGroup>
                            </ice:panelCollapsible>
                        </ice:form>
                    </ice:column>
                </ice:panelGrid>
                
                <!-- Pie de Pagina -->
                <div>
                    <ice:panelGrid id="bottom" style="position:relative;border-style: solid;border-width: 1px; border-color: #EEEEEE; left:1%" width="98%;">
                        <jsp:directive.include file="pieDePagina.jspf"/>
                    </ice:panelGrid>
                </div>
                <!-- Ventana Popup (Reutilizable) -->
                <jsp:directive.include file="ModalPopupActualizacionClima.jspf"/>
            </body>
        </html>
    </f:view>
</jsp:root>
