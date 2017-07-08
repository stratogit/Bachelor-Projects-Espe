<%-- 
    Document   : ejemplo1
    Created on : Apr 12, 2010, 5:20:52 AM
    Author     : zanty
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="cursojava.bookstore.database.BookDB"%>
<html>
     <%-- Crear una variable del tipo BookDB para interactuar con la base de datos --%>
    <%! BookDB bookDB;%>
    <%-- Sobreescribir el método jspInit para que instancie un objeto BookDB y lo referencie con la variable declarada en el paso anterior--%>
    <%!
     public void jspInit(){
        //Crea una instancia de la clase que le permite conectarse a la base de datos
         bookDB = new BookDB();

    }%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%-- Incluir el contenido de la pagina banner.jsp, utilizando ladirectiva include --%>
        <%@include file="banner.jsp"%>
        
        <%-- Incluir un hyperlink "Iniciar Compra" que nos lleve a bookcatalog.jsp--%>
        <b><a href="bookcatalog.jsp">Iniciar Compra</a></b>

        
    </body>
</html>
