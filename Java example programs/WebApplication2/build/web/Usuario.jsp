
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
            <title>Pagina Usuario</title>
        </head>
        <body background="imagenes/fondo2.jpg">
            <h1><h:outputText value="#{msn.titulou}"/></h1>
        </body>
    </html>
</f:view>
