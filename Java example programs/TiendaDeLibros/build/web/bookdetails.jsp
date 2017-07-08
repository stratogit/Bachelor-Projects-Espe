<%-- 
    Document   : bookdetails
    Created on : Apr 13, 2010, 7:13:44 AM
    Author     : zanty
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="cursojava.bookstore.database.BookDB,cursojava.bookstore.database.Book,java.util.List,java.util.Iterator"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%-- Crear una variable BookDB e instanciarla sobreescribiendo el método jspInit --%>
<%! BookDB bookDB;%>
    <%!
     public void jspInit(){
        //Crea una instancia de la clase que le permite conectarse a la base de datos
         bookDB = new BookDB();

    }%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%-- Incluir el banner --%>
         <%@include file="banner.jsp"%>
        <% String bookId=request.getParameter("bookId");
         Book book=bookDB.getBook(bookId);
          %>
         <h2><%= book.getTitle() %></h2>
                        Por<em>
                        <%= book.getFirstName() +" " +book.getSurname() %>
                       </em><%= book.getYear() %>
                        <br><br><h4>
                         DEscripcion </h4>
                        <blockquote> <%= book.getDescription() %> </blockquote>
                        <h4>
                        Precio <%= book.getPrice() %></h4><p><strong><a href=bookcatalog.jsp??bookId=<%= book.getBookId()%>"">
                        Agregar a carrito</a></strong>
                            <strong><a href="bookcatalog.jsp">Continuar comprando
                        </a></strong></p>


       <%-- Recuperar el libro de la base de datos usando el método getBookId(idDelLibro)
            del objeto BookDB instanciado. Pasarle como parametro el id del libro que llega
            como parámetro en la petición.%>



       <%-- Mostrar la informacion del libro recuperado. Usar el formato
            que se muestra en el ejemplo descripcion.html --%>

       
       <%-- Agregar un link "Añadir al Carrito" que llame a bookcatalog.jsp y le pase el
        id del libro --%>


       <%-- Agregar un link "Continuar Comprando" que llame a bookcatalog.jsp sin parámetros --%>
    </body>
</html>
