/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package cursojava.bookstore.servlets;

import cursojava.bookstore.database.Book;
import cursojava.bookstore.database.BookDB;
import cursojava.bookstore.database.ShoppingCart;
import cursojava.bookstore.database.ShoppingCartItem;
import cursojava.bookstore.exceptions.BookNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
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
public class ShowCartServlet extends HttpServlet {
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
        
        HttpSession session = request.getSession(true);


        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");

        // Si no tiene un carro, lo crea y lo agrega a sesion
        if (cart == null) {
            cart = new ShoppingCart();
            session.setAttribute("cart", cart);
        }

        response.setContentType("text/html");
        response.setBufferSize(8192);

        PrintWriter out = response.getWriter();

        out.println(
                "<html>" + "<head><title>"
                + "Carrito de compras"+ "</title></head>");

        //TODO: Agregar el banner
       
        
        String bookId = request.getParameter("Remove");
        Book bd=null;

        if (bookId != null) {
            try {
                    bd = bookDB.getBook(bookId);
                cart.remove(bookId);
                out.println(
                        "<font color=\"#ff00000\" size=\"+2\">"
                        +  "Acaba de quitar " + "<strong>"
                        + bd.getTitle() + "</strong> <br> &nbsp; <br>"
                        + "</font>");
            } catch (BookNotFoundException ex) {
                response.reset();
                throw new ServletException(ex);
            }
        } 
        //TODO: Agregar codigo para vaciar el carro de compras,con el parametro del hyperlink respectivo



        int num = cart.getNumberOfItems();
        if (num > 0) {
            // Muestra un resumen del carrito de compras

            out.println(
                    "<font size=\"+2\">" + "Su carro de compras tiene "
                    + num
                    + ((num == 1) ? " art" + "\u00ed" + "culo"
                                  : " art" + "\u00ed" + "culos" )
                    + "</font><br>&nbsp;");

        // Muestra el contenido del carro de compras

            out.println(
                    "<table>" + "<tr>" + "<th align=left>"
                    + "Cantidad" + "</TH>"
                    + "<th align=left>" + "T" + "\u00ed" + "tulo"
                    + "</TH>" + "<th align=left>"
                    + "Precio" + "</TH>" + "</tr>");

            Iterator i = cart.getItems()
                             .iterator();
         
            while (i.hasNext()) {
                ShoppingCartItem item = (ShoppingCartItem) i.next();
                bd = (Book) item.getItem();

                out.println(
                        "<tr>" + "<td align=\"right\" bgcolor=\"#ffffff\">"
                        + item.getQuantity() + "</td>"
                        + "<td bgcolor=\"#ffffaa\">" + "<strong><a href=\""
                        + response.encodeURL(
                                request.getContextPath()
                                + "/bookdetails?bookId=" + bd.getBookId())
                        + "\">" + bd.getTitle() + "</a></strong>" + "</td>"
                        + "<td bgcolor=\"#ffffaa\" align=\"right\">"
                        + bd.getPrice() + "</td>" + "<td bgcolor=\"#ffffaa\">"
                        + "<strong>" + "<a href=\""
                        + response.encodeURL(
                                request.getContextPath()
                                + "/bookshowcart?Remove=" + bd.getBookId())
                        + "\">" + "Quitar art" + "\u00ed" + "culo"
                        + "</a></strong>" + "</td></tr>");
            }

            // Imprime el total
            out.println(
                    "<tr><td colspan=\"5\" bgcolor=\"#ffffff\">"
                    + "<br></td></tr>" + "<tr>"
                    + "<td colspan=\"2\" align=\"right\""
                    + "bgcolor=\"#ffffff\">" + "Subtotal"
                    + "</td>" + "<td bgcolor=\"#ffffaa\" align=\"right\">"
                    + cart.getTotal() + "</td>"
                    + "</td><td><br></td></tr></table>");

            // Hyperlinks
            out.println(
                    "<p> &nbsp; <p><strong><a href=\""
                    + response.encodeURL(
                            request.getContextPath() + "/bookcatalog") + "\">"
                    + "Continuar Comprando"
                    + "</a> &nbsp; &nbsp; &nbsp;" + "<a href=\""
                    + response.encodeURL(
                            request.getContextPath() + "/bookcashier") + "\">"
                    +  "Salir"
                    + "</a> &nbsp; &nbsp; &nbsp;" + "<a href=\""
                    + response.encodeURL(
                            request.getContextPath()
                            + "/bookshowcart?Clear=clear") + "\">"
                    + "Vaciar el Carro de Compras" + "</a></strong>");
        } else {
            // Shopping cart is empty!
            out.println(
                    "<font size=\"+2\">" +  "Su carro de compras esta vac" + "\u00ed" + "o."
                    + "</font>" + "<br> &nbsp; <br>" + "<center><a href=\""
                    + response.encodeURL(
                            request.getContextPath() + "/bookcatalog") + "\">"
                    + "Volver al Cat" + "\u00e1" + "logo" + "</a> </center>");
        }

        out.println("</body> </html>");
        out.close();
    }

    public String getServletInfo() {
        return "The ShowCart servlet returns information about"
        + "the books that the user is in the process of ordering.";
    }
}
