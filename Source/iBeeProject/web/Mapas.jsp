<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Document   : Mapas
    Created on : 23-ago-2009, 21:41:47
    Author     : farias.facundo
-->

<jsp:root version="2.1" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:ice="http://www.icesoft.com/icefaces/component"
          xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:m="http://code.google.com/p/gmaps4jsf/">
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

                    <script src="http://gmaps-utility-library-dev.googlecode.com/svn/trunk/tabbedmaxcontent/src/tabbedmaxcontent_packed.js" type="text/javascript"> </script>

                    ]]>
                </f:verbatim>
            </head>

            <!-- Cuerpo -->

            <body id="outputBody1" style="-rave-layout: grid">
                <ice:form id="hdr" style="top:6%; left:1%; right:1%; position:absolute">
                    <jsp:directive.include file="./Header.jspf"/>
                </ice:form>
                <jsp:directive.include file="./cabecera.jspf"/>

                <!-- Parametros para el Mapa -->
                <div >
                    <ice:panelGrid cellspacing="0px"
                                   style="margin-top:-3.5%;margin-left:1%; width:98%; alignment:top;border-style: solid;border-width: 1px; border-color: #EEEEEE">
                        <ice:form id="body1">
                            <ice:panelGroup style="vertical-align: top;" >
                                <ice:panelCollapsible id="paramMapa" expanded="true" >
                                    <f:facet name="header">
                                        <ice:panelGroup>
                                            <ice:outputText id="formHeaderParamMap" value="Parametros"/>
                                        </ice:panelGroup>
                                    </f:facet>
                                    <jsp:directive.include file="./parametrosMapa.jspf"/>
                                </ice:panelCollapsible>
                            </ice:panelGroup>
                        </ice:form>
                    </ice:panelGrid>
                </div>

                <!-- Mapa -->
                <div>
                    <ice:panelGrid cellspacing="0px" columnClasses="columna1, columna2" columns="1"
                                   style="margin-top:0%;margin-left:1%; width:98%; alignment:top;border-style: solid;border-width: 1px; border-color: #EEEEEE">
                        <ice:form id="body2">
                            <ice:panelGroup style="vertical-align: top;" >
                                <ice:panelCollapsible id="Mapa" expanded="true" >
                                    <f:facet name="header">
                                        <ice:panelGroup>
                                            <ice:outputText id="formHeaderMap" value="Mapa"/>
                                        </ice:panelGroup>
                                    </f:facet>
                                    <m:map rendered="true" zoom="7" id="mapa" renderOnWindowLoad="false"  binding="#{Mapas.myMap}"
                                           width="100%" latitude="-31.5" longitude="-64">
                                        <m:mapControl id="largectrl" name="GLargeMapControl" />
                                        <m:mapControl id="typectrl" name="GMapTypeControl" position="LEFT"/>
                                    </m:map>
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

                <!-- Ventana Popup (Reutilizable) -->
                <jsp:directive.include file="ModalPopup.jspf"/>

            </body>
        </html>
    </f:view>
</jsp:root>
