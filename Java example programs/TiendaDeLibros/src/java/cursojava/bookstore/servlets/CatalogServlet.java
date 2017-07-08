package cursojava.bookstore.servlets;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


import cursojava.bookstore.database.Book;
import cursojava.bookstore.database.ShoppingCart;
import cursojava.bookstore.database.BookDB;
import cursojava.bookstore.exceptions.BookNotFoundException;
import cursojava.bookstore.exceptions.BooksNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Iterator;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author zanty
 */
public class CatalogServlet extends HttpServlet {
   
 private BookDB bookDB;   
    @Override
    public void init() throws ServletException {
        //Crea una instancia de la clase que le permite conectarse a la base de datos
         bookDB = new BookDB();

    }

    @Override
    public void destroy() {
        bookDB = null;
    }

    @Override
    public void doGet(
        HttpServletRequest request,
        HttpServletResponse response) throws ServletException, IOException {

        //TODO:Manejar un objeto del tipo ShpoppingCart en la sesión


        response.setContentType("text/html");
        response.setBufferSize(8192);

        PrintWriter out = response.getWriter();

        out.println(
                "<html>" + "<head><title>"
                + "Catalogo" + "</title></head>");

       //TODO: utilizando el RequestDispatcher, incluir el servlet /banner
        
        
        // TODO: En caso de que el usuario haya invocado a este servlet mediante el link
        // Agregar, recuperar el libro de la base de datos, añadir al carrito de compras
        // y mostrar un mensaje indicando que agregó el libro

            //MENSAJE A MOSTRARSE
                /*out.println(
                        "<p><h3>" + "<font color=\"#ff0000\">"
                        + "A" + "\u00f1" + "adi" + "\u00f3" + " " + "<i>"
                        //TODO: incluir titulo del libro recuperado
                        "</i> "
                        + " a su carro de compras." + "</font></h3>");*/

                 /*MANEJO DE LA EXCEPCION
                  } catch (BookNotFoundException ex) {
                response.reset();
                throw new ServletException(ex);
            }*/
        

        //TODO: En caso de que el carrito tenga items, crear links hacia /bookshowcart y /bookcashier
        //if (cart.getNumberOfItems() > 0) {


        //Lista de libros
        out.println(
                "<br> &nbsp;" + "<h3>" + "Elija el libro de su preferencia: " + "</h3>");
              
        
            //Recupera todos los libros de la basede datos
            //Collection coll = bookDB.getBooks();
            //Iterator i = coll.iterator();
            
            //TODO: Barrerse la lista de libros e ir formando
            //una tabla con la info de cada libro
            //La primera columna tiene el nombre del libro como hyperlink
            //que llama a /bookdetails y le pasa el parametro bookId con el id
            //del libro respectivo, la tercera colomna tiene un hyperlink Añadir al carro de compras
            //que invoca a este mismo servlet y le pasa el bookId del libro que quiere
            //agregar.
            //El formato de la tabla lo encuentra en el archivo tabla.html
            

        out.println("</body></html>");
        out.close();
    }

    public String getServletInfo() {
        return "The Catalog servlet adds books to the user's "
        + "shopping cart and prints the catalog.";
    }
}
