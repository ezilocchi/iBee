<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Document   : CambiarContrasenia
    Created on : 09/04/2010, 17:41:22
    Author     : burni.matias
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


                <!-- Mapa (Panel Izquierdo) -->
                <ice:panelGrid cellspacing="0px" columnClasses="columna1, columna2" columns="2" styleClass="tablaPrincipal">
                    <ice:form>
                        <ice:panelGroup style="vertical-align: top;">
                            <ice:panelCollapsible expanded="true" id="Mapa" toggleOnClick="false">
                                <f:facet name="header">
                                    <ice:panelGroup>
                                        <ice:outputText id="formHeaderMap" value="Mapa"/>
                                    </ice:panelGroup>
                                </f:facet>
                                <jsp:directive.include file="googleMap.jspf"/>
                            </ice:panelCollapsible>
                        </ice:panelGroup>
                    </ice:form>


                    <ice:form id="CambiarContrasenia">
                        <ice:panelCollapsible expanded="true" id="formCambiarContrasenia"
                                              style="position:relative;border-style: solid;border-width: 1px; border-color: #EEEEEE; left:0%;width:100%"
                                              >
                            <f:facet name="header">
                                <ice:panelGroup>
                                    <ice:outputText id="formHeaderCambiarContrasenia" value="Cambiar Contrase&#241;a"/>
                                </ice:panelGroup>
                            </f:facet>
                            <ice:panelGroup >
                                <table class="abm" width="100%">

                                    <tr>
                                        <td class="title">
                                            <ice:outputText value="Contrase&#241;a Anterior"/>
                                        </td>
                                        <td>
                                            <ice:inputSecret id="inputPasswordAnterior" styleClass="abmInput"
                                                             value="#{CambiarContrasenia.passwordViejo}">
                                                <f:validateLength minimum="2" maximum="45" />
                                            </ice:inputSecret>
                                        </td>
                                        <td class="extension"></td>
                                    </tr>
                                    <tr>
                                        <td> </td>
                                        <td colspan="2">
                                            <span class="validator">
                                                <ice:message for="inputPassword" id="mePassword" style="color:red; line-height:200%;background: url( 'xmlhttp/css/rime/css-images/bullet.gif' ) no-repeat 0 3px;padding-left:15px"/>
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td> </td>
                                        <td colspan="2">
                                            <span class="validator">
                                                <ice:inputText id ="passwordViejoErroneo" rendered="false"/>
                                                <ice:message for="passwordViejoErroneo" id="mpasswordViejoErroneo" style="color:red; line-height:200%;background: url( 'xmlhttp/css/rime/css-images/bullet.gif' ) no-repeat 0 3px;padding-left:15px"/>
                                            </span>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="title">
                                            <ice:outputText value="Contrase&#241;a Nueva"/>
                                        </td>
                                        <td>
                                            <ice:inputSecret id="inputPasswordNuevo" styleClass="abmInput"
                                                             value="#{CambiarContrasenia.passwordNuevo}">
                                                <f:validateLength minimum="2" maximum="45" />
                                            </ice:inputSecret>
                                        </td>
                                        <td class="extension"></td>
                                    </tr>
                                    <tr>
                                        <td> </td>
                                        <td colspan="2">
                                            <span class="validator">
                                                <ice:message for="inputPassword" id="miPassword" style="color:red; line-height:200%;background: url( 'xmlhttp/css/rime/css-images/bullet.gif' ) no-repeat 0 3px;padding-left:15px"/>
                                            </span>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="title">
                                            <ice:outputText value="Confirmar Contrase&#241;a Nueva"/>
                                        </td>
                                        <td>
                                            <ice:inputSecret id="inputPasswordNuevoConf" styleClass="abmInput"
                                                             value="#{CambiarContrasenia.passwordNuevoConf}">
                                                <f:validateLength minimum="2" maximum="45" />
                                            </ice:inputSecret>
                                        </td>
                                        <td class="extension"></td>
                                    </tr>
                                    <tr>
                                        <td> </td>
                                        <td colspan="2">
                                            <span class="validator">
                                                <ice:message for="inputPassword" id="moPassword" style="color:red; line-height:200%;background: url( 'xmlhttp/css/rime/css-images/bullet.gif' ) no-repeat 0 3px;padding-left:15px"/>
                                            </span>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td> </td>
                                        <td colspan="2">
                                            <span class="validator">
                                                <ice:inputText id ="passwordConfirmacion" rendered="false"/>
                                                <ice:message for="passwordConfirmacion" id="mpasswordConfirmacion" style="color:red; line-height:200%;background: url( 'xmlhttp/css/rime/css-images/bullet.gif' ) no-repeat 0 3px;padding-left:15px"/>
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td> </td>
                                        <td colspan="2">
                                            <span class="validator">
                                                <ice:inputText id ="confirmacion" rendered="false"/>
                                                <ice:message for="confirmacion" id="mconfirmacion" style="color:red; line-height:200%;background: url( 'xmlhttp/css/rime/css-images/bullet.gif' ) no-repeat 0 3px;padding-left:15px"/>
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td class="aceptar">
                                            <ice:commandButton id="aceptar" value="Aceptar" action="#{CambiarContrasenia.actionAceptar}" type="submit" image="/resources/icons/buttons/guardar.png" />
                                        </td>
                                        <td>
                                            <ice:commandButton immediate="true" id="cancelar" value="Cancelar" action="#{CambiarContrasenia.actionCancelar}" type="submit" image="/resources/icons/buttons/Cancelar.png" />
                                        </td>
                                    </tr>
                                </table>
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

                <!-- Ventana Popup (Reutilizable) -->

            </body>
        </html>
    </f:view>
</jsp:root>
