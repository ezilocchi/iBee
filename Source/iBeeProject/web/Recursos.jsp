<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Document   : Recursos
    Created on : 07/04/2010, 19:19:21
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

            <body id="outputBody1" style="-rave-layout: grid">
                <ice:form id="hdr" style="top:6%; left:1%; right:1%; position:absolute">
                    <jsp:directive.include file="./Header.jspf"/>
                </ice:form>
                <jsp:directive.include file="./cabecera.jspf"/>
                <!-- formulario -->
                <div>
                    <ice:panelGrid cellspacing="0px" columnClasses="columna1, columna2" columns="1"
                                   style="margin-top:-3.5%;margin-left:1%; width:98%; alignment:top;border-style: solid;border-width: 1px; border-color: #EEEEEE">
                        <ice:form id="body2">
                            <ice:panelGroup style="vertical-align: top;" >

                                <ice:panelCollapsible id="recursos" expanded="true" style="width:99.9%">
                                    <f:facet name="header">
                                        <ice:panelGroup>
                                            <ice:outputText id="formHeaderRecursos" value="Recursos"/>
                                        </ice:panelGroup>
                                    </f:facet>
                                    <ice:panelGroup >
                                        <table class="abm" align="center" width="10%">

                                            <tr>
                                                <td class="title">
                                                    <ice:outputText value="Cargo"/>
                                                </td>
                                                <td width="30%">
                                                    <ice:selectOneMenu value="#{Recursos.cargo.idCargo}" id="CargoCombo" title="cargo" styleClass="abmInput">
                                                        <f:selectItems  value="#{Recursos.cargos}" />
                                                    </ice:selectOneMenu>
                                                </td>
                                                <td class="extension">
                                                </td>
                                            </tr>

                                            <tr>
                                                <td colspan="1"></td>
                                                <td colspan="2">
                                                    <ice:panelCollapsible id="panelCollap" expanded="false" styleClass="o_folding_panel" style="width:60%">
                                                        <f:facet name="header">
                                                            <ice:panelGroup>
                                                                <ice:outputText id="formHeaderCargos" value="Asignar Recursos"/>
                                                            </ice:panelGroup>
                                                        </f:facet>
                                                        <ice:panelGroup style="vertical-align: top;">
                                                            <!-- Data Table -->
                                                 <ice:dataTable columnClasses="rowTable" headerClass="hdrTable" id="dataTableEnf" rowClasses="rowTable"
                                                                           title="Cargos" value="#{agregarCargo.recursoXCargos}" var="recursoXCargos" width="100%" rows="24">
                                                                <ice:column id="col1">
                                                                    <ice:outputText id="outputText1" value="#{recursoXCargos.recurso.nombre}"/>
                                                                    <f:facet name="header">
                                                                        <ice:outputText id="outputText2" value="Nombre Recurso"/>
                                                                    </f:facet>
                                                                </ice:column>

                                                                <ice:column id="col2">
                                                                    <ice:selectBooleanCheckbox id="selectCheck" value="#{recursoXCargos.habilitado}" partialSubmit="true"/>
                                                                    <f:facet name="header">
                                                                        <ice:outputText id="head5" value="Habilitar"/>
                                                                    </f:facet>
                                                                </ice:column>
                                                            </ice:dataTable>
                                                        </ice:panelGroup>
                                                    </ice:panelCollapsible>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td> </td>
                                                <td colspan="2">
                                                    <span class="validator">
                                                        <ice:inputText id ="saveDefault" rendered="false"/>
                                                        <ice:message for="saveDefault" id="msaveDefault" style="color:red; line-height:200%;background: url( 'xmlhttp/css/rime/css-images/bullet.gif' ) no-repeat 0 3px;padding-left:15px"/>
                                                    </span>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td></td>
                                                <td class="aceptar" align="left">
                                                    <ice:commandButton action="#{Recursos.actionAceptar}" id="aceptar" image="/resources/icons/buttons/editar.png" type="submit" value="Aceptar"/>
                                                </td>
                                            </tr>

                                        </table>
                                    </ice:panelGroup>
                                </ice:panelCollapsible>

                            </ice:panelGroup>
                        </ice:form>
                    </ice:panelGrid>
                </div>

                <!-- Pie de Pagina -->
                <div>
                    <ice:panelGrid id="bottom" style="position:relative;border-style: solid;border-width: 1px; border-color: #EEEEEE; left:1%" width="98%;">
                        <jsp:directive.include file="./pieDePagina.jspf"/>
                    </ice:panelGrid>
                </div>
            </body>

        </html>
    </f:view>
</jsp:root>

