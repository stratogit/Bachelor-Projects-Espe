<%-- 
    Document   : bookcatalog
    Created on : Apr 12, 2010, 5:38:10 AM
    Author     : zanty
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="cursojava.bookstore.database.BookDB,cursojava.bookstore.database.Book,java.util.List,java.util.Iterator"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%-- Crear una variable BookDB e instanciarla sobreescribiendo el método jspInit --%>

        <%-- Incluir el banner --%>
        <%@include file="banner.jsp"%>


        <%! BookDB bookDB;%>
        <%!
            public void jspInit() {
                //Crea una instancia de la clase que le permite conectarse a la base de datos
                bookDB = new BookDB();

        }%>

        <br><h3>Elija el libro de su preferencia:</h3>

        <%-- Recuperar la lista de libros de la base usando bookDB.getBooks() --%>
        <%-- Barrerse la lista de libros e ir guardando cada libro en una variable libro de tipo Book --%>

        <%-- Crear una tabla que muestre información de cada libro, usar el formato mostrado en tabla.html
             la informacion de cada libro la puede obtener de la variable libro del paso anterior--%>

        <%-- En el hyperlink que tiene el nombre del libro, invocar a bookdetails.jsp y pasarle como parámetro id del libro elegido--%>

        <%-- En el hyperlink Añadir al carro invocar a este mismo jsp y pasarle como parametro el id del libro elegido--%>

        <center>
            <table>
                <%List libros = bookDB.getBooks();
                         for (Object object : libros) {
                             Book book = (Book) object;%>
                <tr><td><a href="bookdetails.jsp?bookId=<%= book.getBookId()%>"><strong> <%= book.getTitle()%> </strong></a></td>
                    <td bgcolor="#ffffaa" rowspan=2> <%= book.getPrice()%>   </td>
                    <td bgcolor="#ffffaa" rowspan=2> <a href="bookcatalog.jsp?bookId=<%= book.getBookId()%>">Añadir al carro</a></td>
                </tr>
                <tr>
                    <td bgcolor="#ffffff">por<em> <%= book.getFirstName()%> <%= book.getSurname()%></em></td>
                </tr>
                <% }%>
            </table>
        </center>

    </body>
</html>

<%-- Escribir el código necesario para guardar en sesión un objeto ShoppingCart
--%>




<%-- En caso de que el usuario acceda a esta jsp mediante el link Añadir al carro,
recuperar el libro de la base de datos y agregar dicho libro al objeto ShoppingCart de sesión.--%>
