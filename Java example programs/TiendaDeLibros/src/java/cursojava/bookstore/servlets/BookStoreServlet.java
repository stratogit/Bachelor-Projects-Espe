package cursojava.bookstore.servlets;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


import cursojava.bookstore.database.BookDB;
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
public class BookStoreServlet extends HttpServlet {

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

        response.setContentType("text/html");
        response.setBufferSize(8192);

        PrintWriter out = response.getWriter();

        out.println("<html>" + "<head><title>Duke's Bookstore7</title></head>");

        //TODO: utilizando el RequestDispatcher, incluir el servlet /banner
        
         out.println(
                    "<b><a href=\""
        //TODO: completar el código del hyperlink para que invoque a /bookcatalog,
        //utilizar response.encodeURL y request.getContexthPath para armar el hyperlynk
                    
                    + "\">" +
                    "<b>" + "Iniciar compra"
                    + "</b></a></font><br>" + "<br>" + "<br>"
                    + "<br>" );

            out.println("</body></html>");
        out.close();
    }

    @Override
    public String getServletInfo() {
        return "The BookStore servlet returns the main web page "
                + "for Duke's Bookstore.";
    }

   
}
