<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Document   : Login
    Created on : 27-jun-2009, 15:51:45
    Author     : farias.facundo
-->
<jsp:root version="2.1" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:ice="http://www.icesoft.com/icefaces/component" xmlns:jsp="http://java.sun.com/JSP/Page">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <html id="outputHtml1">
            <head id="outputHead1">
                <jsp:directive.include file="./styles.jspf"/>
                <title>iBee Project</title>
            </head>
            <body id="outputBody1" style="-rave-layout: grid">
                <ice:form id="form2">
                    <div id="pagecell1" style="left:25%; width:576px;height:217px;">
                        <img alt="" src="resources/tl_curve_white.gif" height="6" width="6" id="tl"/>
                        <img alt="" src="resources/tr_curve_white.gif" height="6" width="6" id="tr"/>
                        <div id="pageName" style="border:none;">
                            <h2 style="margin:4% 0 0 4%;">iBee</h2>
                            <img src="resources/icono.gif" alt="small logo" height="70"/>
                        </div>
                        <div id="content" style="border:none; margin: 0; border-top:1px solid #CCD2D2;margin-top:0.5%;">
                                <div style="margin-left: 61px;">
                                    <table>
                                        <tr>
                                            <td><ice:outputLabel id="lblUsuario" value="Usuario"/> </td>
                                            <td><ice:inputText id="txtUsuario" value="#{Login.user}"/>
                                            <ice:message for="txtUsuario" id="mtxtUsuario" style="color:red; line-height:200%;background: url( 'xmlhttp/css/rime/css-images/bullet.gif' ) no-repeat 0 3px;padding-left:15px"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><ice:outputLabel id="lblContrasenia" value="Contraseña"/> </td>
                                            <td><ice:inputSecret id="scrtContrasenia" redisplay="true" value="#{Login.pass}"/>
                                            <ice:message for="scrtContrasenia" id="mscrtContrasenia" style="color:red; line-height:200%;background: url( 'xmlhttp/css/rime/css-images/bullet.gif' ) no-repeat 0 3px;padding-left:15px"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td><ice:commandButton action="#{Login.btnEntrar_action}" image="/resources/icons/buttons/login.png"
                                            id="btnEntrar" value="Entrar"/></td>
                                        </tr>
                                    </table>
                                </div>
                            <br/>
                        </div>
                        <!--end content -->
                        <div id="siteInfo" style="border: 1px solid rgb(204, 204, 204); margin: 2px;">
                            <div align="right">
                                <strong>2009 iBee</strong>
                            </div>
                        </div>
                    </div>
                </ice:form>
            </body>
        </html>
    </f:view>
</jsp:root>
