<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Document   : ActualizarDatos
    Created on : 16/03/2010, 06:42:44
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


                    <ice:form id="ActualizarDatos">
                        <ice:panelCollapsible expanded="true" id="formActualizarDatos"
                                              style="position:relative;border-style: solid;border-width: 1px; border-color: #EEEEEE; left:0%;width:100%"
                                              >
                            <f:facet name="header">
                                <ice:panelGroup>
                                    <ice:outputText id="formHeaderActualizarDatos" value="Actualizar Datos"/>
                                </ice:panelGroup>
                            </f:facet>
                            <ice:panelGroup >


                                <table class="abm" width="100%">
                                    <tr>
                                        <td class="title">
                                            <ice:outputText value="Nro. Empleado (*)"/>
                                        </td>
                                        <td>
                                            <ice:inputText id="inputLegajo" styleClass="abmInput" readonly="true"
                                                           value="#{ActualizarDatos.empleado.legajo}">
                                            </ice:inputText>
                                        </td>
                                        <td class="extension"></td>
                                    </tr>
                                    <tr>
                                        <td class="title">
                                            <ice:outputText value="Nombre (*)"/>
                                        </td>
                                        <td>
                                            <ice:inputText id="inputNombre" styleClass="abmInput"
                                                           value="#{ActualizarDatos.empleado.nombre}" required="true">
                                                <f:validateLength minimum="2" maximum="100" />
                                            </ice:inputText>
                                        </td>
                                        <td class="extension"></td>
                                    </tr>
                                    <tr>
                                        <td> </td>
                                        <td colspan="2">
                                            <span class="validator">
                                                <ice:message for="inputNombre" id="minputNombre" style="color:red; line-height:200%;background: url( 'xmlhttp/css/rime/css-images/bullet.gif' ) no-repeat 0 3px;padding-left:15px"/>
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="title">
                                            <ice:outputText value="Apellido (*)"/>
                                        </td>
                                        <td>
                                            <ice:inputText id="inputApellido" styleClass="abmInput"
                                                           value="#{ActualizarDatos.empleado.apellido}">
                                                <f:validateLength minimum="2" maximum="100" />
                                            </ice:inputText>
                                        </td>
                                        <td class="extension"></td>
                                    </tr>
                                    <tr>
                                        <td> </td>
                                        <td colspan="2">
                                            <span class="validator">
                                                <ice:message for="inputApellido" id="minputApellido" style="color:red; line-height:200%;background: url( 'xmlhttp/css/rime/css-images/bullet.gif' ) no-repeat 0 3px;padding-left:15px"/>
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="title">
                                            <ice:outputText value="Email (*)"/>
                                        </td>
                                        <td>
                                            <ice:inputText id="inputEmail" styleClass="abmInput"
                                                           value="#{ActualizarDatos.empleado.email}">
                                            </ice:inputText>
                                        </td>
                                        <td class="extension"></td>
                                    </tr>
                                    <tr>
                                        <td> </td>
                                        <td colspan="2">
                                            <span class="validator">
                                                <ice:inputText id ="emailDefault" rendered="false"/>
                                                <ice:message for="emailDefault" id="memailDefault" style="color:red; line-height:200%;background: url( 'xmlhttp/css/rime/css-images/bullet.gif' ) no-repeat 0 3px;padding-left:15px"/>
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="title">
                                            <ice:outputText value="Estado"/>
                                        </td>
                                        <td>
                                            <ice:selectOneMenu value="#{ActualizarDatos.empleado.estado.numero}" id="EstadoCombo" title="estado" styleClass="abmInput">
                                                <f:selectItems  value="#{Empleados.estadosEmpleado}" />
                                            </ice:selectOneMenu>
                                        </td>
                                        <td class="extension">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="title">
                                            <ice:outputText value="Cargo"/>
                                        </td>
                                        <td>
                                            <ice:selectOneMenu value="#{ActualizarDatos.empleado.cargo.idCargo}" id="CargoCombo" title="cargo" styleClass="abmInput">
                                                <f:selectItems  value="#{Empleados.cargos}" />
                                            </ice:selectOneMenu>
                                        </td>
                                        <td class="extension">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="title">
                                            <ice:outputText value="Observaciones"/>
                                        </td>
                                        <td>
                                            <ice:inputText id="inputObservaciones" styleClass="abmInput"
                                                           value="#{ActualizarDatos.empleado.observaciones}">
                                            </ice:inputText>
                                        </td>
                                        <td class="extension"></td>
                                    </tr>
                                    <tr>
                                        <td class="title">
                                            <ice:outputText value="Usuario (*)"/>
                                        </td>
                                        <td>
                                            <ice:inputText id="inputUsuario" styleClass="abmInput"
                                                           value="#{ActualizarDatos.empleado.usuario}" required="true">
                                                <f:validateLength minimum="2" maximum="100" />
                                            </ice:inputText>
                                        </td>
                                        <td class="extension"></td>
                                    </tr>
                                    <tr>
                                        <td> </td>
                                        <td colspan="2">
                                            <span class="validator">
                                                <ice:inputText id ="usuarioDefault" rendered="false"/>
                                                <ice:message for="usuarioDefault" id="musuarioDefault" style="color:red; line-height:200%;background: url( 'xmlhttp/css/rime/css-images/bullet.gif' ) no-repeat 0 3px;padding-left:15px"/>
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td> </td>
                                        <td colspan="2">
                                            <span class="validator">
                                                <ice:message for="inputUsuario" id="minputUsuario" style="color:red; line-height:200%;background: url( 'xmlhttp/css/rime/css-images/bullet.gif' ) no-repeat 0 3px;padding-left:15px"/>
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="title">
                                            <ice:outputText value="Fecha Alta"/>
                                        </td>
                                        <td>
                                            <ice:selectInputDate id="fechaAlta" required="true" value="#{ActualizarDatos.empleado.fechaAlta}" highlightUnit="DAY_OF_YEAR" highlightValue="1" renderAsPopup="true">
                                                <f:convertDateTime pattern="dd-MMM-yyyy" />
                                            </ice:selectInputDate>
                                        </td>
                                        <td class="extension"></td>
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
                                        <td> </td>
                                        <td colspan="2">
                                            <span class="validator">
                                                <ice:message for="fechaAlta" id="mFechaAlta" style="color:red; line-height:200%;background: url( 'xmlhttp/css/rime/css-images/bullet.gif' ) no-repeat 0 3px;padding-left:15px"/>
                                            </span>
                                        </td>
                                    </tr>
                                    <!--
                                    <tr>
                                        <td> </td>
                                        <td colspan="2">
                                            <span class="validator">
                                                <ice:inputText id ="datosIguales" rendered="false"/>
                                                <ice:message for="datosIguales" id="mdatosIguales" style="color:red; line-height:200%;background: url( 'xmlhttp/css/rime/css-images/bullet.gif' ) no-repeat 0 3px;padding-left:15px"/>
                                            </span>
                                        </td>
                                    </tr> -->
                                    <tr>
                                        <td></td>
                                        <td class="aceptar">
                                            <ice:commandButton id="aceptar" value="Aceptar" action="#{ActualizarDatos.actionAceptar}" type="submit" image="/resources/icons/buttons/guardar.png" />
                                        </td>
                                        <td>
                                            <ice:commandButton immediate="true" id="cancelar" value="Cancelar" action="#{ActualizarDatos.actionCancelar}" type="submit" image="/resources/icons/buttons/Cancelar.png" />
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