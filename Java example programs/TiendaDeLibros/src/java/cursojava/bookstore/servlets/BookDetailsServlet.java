/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package cursojava.bookstore.servlets;

import cursojava.bookstore.database.Book;
import cursojava.bookstore.database.BookDB;
import cursojava.bookstore.exceptions.BookNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author zanty
 */
public class BookDetailsServlet extends HttpServlet {
   

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


    public void doGet(
        HttpServletRequest request,
        HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        response.setBufferSize(8192);

        PrintWriter out = response.getWriter();

        out.println(
                "<html>" + "<head><title>"
                + "Descripcion del Libro"
                + "</title></head>");

        //TODO:Agregar el banner usando RequestDispatcher
      

        //TODO:recupear  el parametro bookId
      
        //TODO:con el parametro recuperado, traer el libro de la bdd
        //y mostrar información del libro. El formato para mostrar la
        //información lo puede encontrar en descripcion.html
        //El link agregar a carrito, llama a BookStoreServlet con el id de libro respectivo
        //El link seguir comprando llama a CatalogServlet


              out.println("</body></html>");
        out.close();
    }

    public String getServletInfo() {
        return "The BookDetail servlet returns information about"
        + "any book that is available from the bookstore.";
    }


}
