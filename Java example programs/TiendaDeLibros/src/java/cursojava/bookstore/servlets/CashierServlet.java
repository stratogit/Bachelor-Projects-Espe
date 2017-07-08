/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package cursojava.bookstore.servlets;

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
public class CashierServlet extends HttpServlet {
     public void doGet(
        HttpServletRequest request,
        HttpServletResponse response) throws ServletException, IOException {


        HttpSession session = request.getSession();
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");

        if (cart == null) {
            cart = new ShoppingCart();
            session.setAttribute("cart", cart);
        }

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();



        out.println(
                "<html>" + "<head><title>" + "Cajero"
                + "</title></head>");

        //TODO: Agregar el banner


        out.println(
                "<p>" + "Su importe total es:" + "<strong>"
                //TODO:recuperar el atributo total del carrito de compras
                + cart.getTotal() + "</strong>" + "<p>"
                + "Para poder comprar los art" + "\u00ed"
                + "culos en su carro de compras, facilite la informaci"
                + "\u00f3" + "n siguiente:" + "<form action=\""
                //TODO:COmpletar el action del form para que invoque a /bookreceipt
                + "\" method=\"post\">" + "<table >" + "<tr>"
                + "<td><strong>" + "Nombre"
                + "</strong></td>"
                + "<td><input type=\"text\" name=\"cardname\""
                + "value=\"Gwen Canigetit\" size=\"19\"></td>" + "</tr>"
                + "<tr>" + "<td><strong>" + "Identificacion"
                + "</strong></td>" + "<td>"
                + "<input type=\"text\" name=\"cardnum\" "
                + "value=\"xxxx xxxx xxxx xxxx\" size=\"19\"></td>" + "</tr>"
                + "<tr>" + "<td></td>" + "<td><input type=\"submit\""
                + "value=\"" +"Enviar" + "\"></td>"
                + "</tr>" + "</table>" + "</form>" + "</body>" + "</html>");
        out.close();
    }

    public String getServletInfo() {
        return "The Cashier servlet takes the user's name and "
        + "credit card number so that the user can buy the books.";
    }

}
