<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Document   : Lost
    Created on : 21-mar-2010, 21:12:30
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
                <jsp:directive.include file="./cabecera.jspf"/>

                <ice:graphicImage id="outputText7" value="/resources/Under_Construction.jpg"
                                  title="Under Construct"/>
                                  
                <ice:commandLink styleClass="buttonRefresh" value="Volver a Iniciar Sesion"/>

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
