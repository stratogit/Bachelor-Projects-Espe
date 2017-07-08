<%-- 
    Document   : newjsf
    Created on : 26/01/2011, 09:14:50 PM
    Author     : felipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<f:view>
    <f:loadBundle var="msn" basename ="tec2a.recursos.localemsg"/>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>Pagina Administrador</title>
        </head>
        <body background="imagenes/fondo1.jpg" >
            <h:form id="adminForm">
                <center> <h1><h:outputText value="#{msn.tituloa}" /></h1> </center>
                <hr>

                <h:commandLink action="mover">
                    <h:graphicImage value="imagenes/carro.jpeg"/>
                </h:commandLink>

            </h:form>
        </body>
    </html>
</f:view>
