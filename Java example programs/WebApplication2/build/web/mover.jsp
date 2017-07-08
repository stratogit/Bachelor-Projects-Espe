<%-- 
    Document   : mover
    Created on : 28/01/2011, 01:06:00 AM
    Author     : felipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>JSP Page</title>
        </head>
        <body background="imagenes/fondo3.jpg">
            <h:form id="movForm">
                <center> <h1><h:outputText value="Mover Auto"/></h1> </center>
 <P></P>
          <h:commandLink action="1">
                     <h:graphicImage value="imagenes/fa.jpg"/>
           </h:commandLink>
             <P></P>
            <h:commandLink action="2">
                     <h:graphicImage value="imagenes/ab.jpg"/>
           </h:commandLink>
              <P></P>
            <h:commandLink action="3">
                     <h:graphicImage value="imagenes/fi.jpg"/>
           </h:commandLink>
               <P></P>
            <h:commandLink action="4">
                     <h:graphicImage value="imagenes/fd.jpg"/>
           </h:commandLink>
                <P></P>
            </h:form>
        </body>
    </html>
</f:view>
