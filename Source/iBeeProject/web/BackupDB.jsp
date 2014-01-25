<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Document   : Backup_db
    Created on : 06-mar-2010, 17:14:25
    Author     : farias.facundo
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
                    <script type="text/javascript" src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAbSzQ9VpZQwenDnv2GOzjYBS0mfbAkUOhKCwVmgIpLk6yLG9CCBReWtkTVanbYdV5orUhEeUGOvaLsA">
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

                <ice:form id="body">

                    <ice:panelCollapsible expanded="true" id="formBackupDB"
                                          style="position:relative;border-style: solid;border-width: 1px; border-color: #EEEEEE; left:1%;width:98%"
                                          >
                        <f:facet name="header">
                            <ice:panelGroup>
                                <ice:outputText id="formHeaderBackupDB" value="Backup de Base de Datos"/>
                            </ice:panelGroup>
                        </f:facet>
                        <ice:panelGroup >
                            <table class="abm" width="100%">
                                <tr>
                                    <td class="title">
                                        <ice:outputText value="IP del Servidor (*):"/>
                                    </td>
                                    <td>
                                        <ice:inputText id="inputIP" required="true" styleClass="abmInput"
                                                       value="#{BackupDB.server}" requiredMessage="Ingrese una IP para el servidor">
                                        </ice:inputText>
                                    </td>
                                    <td class="extension"></td>
                                </tr>
                                <tr>
                                    <td> </td>
                                    <td colspan="2">
                                        <span class="validator">
                                            <ice:message for="inputIP" style="color:red; line-height:200%; background: url( 'xmlhttp/css/rime/css-images/bullet.gif' ) no-repeat 0 3px; padding-left:15px;"/>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="title">
                                        <ice:outputText value="Puerto (*): "/>
                                    </td>
                                    <td>
                                        <ice:inputText id="inputPort" required="true" styleClass="abmInput" requiredMessage="Ingrese un Puerto para el Servidor"
                                                       value="#{BackupDB.port}">
                                        </ice:inputText>
                                    </td>
                                    <td class="extension"></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td colspan="2">
                                        <span class="validator">
                                            <ice:message for="inputPort" style="color:red; line-height:200%; background: url( 'xmlhttp/css/rime/css-images/bullet.gif' ) no-repeat 0 3px; padding-left:15px;"/>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="title">
                                        <ice:outputText value="Usuario (*):"/>
                                    </td>
                                    <td>
                                        <ice:inputText id="inputUser" required="true" styleClass="abmInput" requiredMessage="Debe especificar un usuario"
                                                       value="#{BackupDB.user}">
                                        </ice:inputText>
                                    </td>
                                    <td class="extension"></td>
                                </tr>
                                <tr>
                                    <td> </td>
                                    <td colspan="2">
                                        <span class="validator">
                                            <ice:message for="inputUser" style="color:red; line-height:200%; background: url( 'xmlhttp/css/rime/css-images/bullet.gif' ) no-repeat 0 3px; padding-left:15px;"/>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="title">
                                        <ice:outputText value="Password (*):"/>
                                    </td>
                                    <td>
                                        <ice:inputSecret id="inputPass" required="true" styleClass="abmInput" requiredMessage="Debe especificar un password"
                                                         value="#{BackupDB.pass}">
                                        </ice:inputSecret>
                                    </td>
                                    <td class="extension"></td>
                                </tr>
                                <tr>
                                    <td> </td>
                                    <td colspan="2">
                                        <span class="validator">
                                            <ice:message for="inputPass" style="color:red; line-height:200%;background: url( 'xmlhttp/css/rime/css-images/bullet.gif' ) no-repeat 0 3px;padding-left:15px"/>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td class="aceptar">
                                        <ice:commandButton id="aceptar" value="Aceptar" image="/resources/icons/buttons/guardar.png"
                                                           action="#{BackupDB.sqlDump}" type="submit"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="title"></td>
                                    <td>
                                        <ice:graphicImage value="/resources/icons/chk_on.png" visible="#{BackupDB.ok}"/>
                                        <ice:outputText value=" El Backup ha finalizado correctamente.- "  visible="#{BackupDB.ok}"/>

                                        <ice:graphicImage value="/resources/icons/chk_off.png"  visible="#{BackupDB.nook}"/>
                                        <ice:outputText value=" El Backup no se puede realizar. Verifique los parametros correspondientes.- "  visible="#{BackupDB.nook}"/>
                                    </td>
                                    <td class="extension"></td>
                                </tr>
                            </table>
                        </ice:panelGroup>
                    </ice:panelCollapsible>
                </ice:form>

                <!-- Pie de Pagina -->
                <div>
                    <ice:panelGrid id="bottom" style="position:relative;border-style: solid;border-width: 1px; border-color: #EEEEEE; left:1%" width="98%;">
                        <jsp:directive.include file="pieDePagina.jspf"/>
                    </ice:panelGrid>
                </div>

                <!-- Ventana Popup (Reutilizable) -->

            </body>
        </html>
    </f:view>
</jsp:root>
