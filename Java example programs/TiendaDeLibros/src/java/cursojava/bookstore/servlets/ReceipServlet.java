/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package cursojava.bookstore.servlets;

import cursojava.bookstore.database.BookDB;
import cursojava.bookstore.database.ShoppingCart;
import java.io.IOException;
import java.io.PrintWriter;
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
public class ReceipServlet extends HttpServlet {
   
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

    public void doPost(
        HttpServletRequest request,
        HttpServletResponse response) throws ServletException, IOException {
        boolean orderCompleted = true;

        HttpSession session = request.getSession(true);

        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");

        if (cart == null) {
            cart = new ShoppingCart();
            session.setAttribute("cart", cart);
        }

        // Actualiza inventario
            bookDB.buyBooks(cart);


        // TODO: Agregar código para invalidar la sesion
        

        response.setContentType("text/html");
        response.setBufferSize(8192);

        PrintWriter out = response.getWriter();

        out.println(
                "<html>" + "<head><title>" +"Recibo"
                + "</title></head>");

        // Incluir el banner
        

        if (orderCompleted) {
            out.println(
                    "<h3>" + "Gracias por su compra "
                    //TODO: Agregar el valor que trae el form en el parametro cardname
                    + ".");
        } else {
            out.println("<h3>" +"No se pudo completar su pedido debido a escasez de inventario.");
        }
        //TODO:Agregar un link continuar comprando que me lleva a /principal
        out.close();
    }

    public String getServletInfo() {
        return "The Receipt servlet updates the book database inventory, invalidates the user session, "
        + "thanks the user for the order.";
    }

}
