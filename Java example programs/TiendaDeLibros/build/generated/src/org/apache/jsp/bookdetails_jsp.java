package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import cursojava.bookstore.database.BookDB;
import cursojava.bookstore.database.Book;
import java.util.List;
import java.util.Iterator;

public final class bookdetails_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

 BookDB bookDB;

     public void jspInit(){
        //Crea una instancia de la clase que le permite conectarse a la base de datos
         bookDB = new BookDB();

    }
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.Vector _jspx_dependants;

  static {
    _jspx_dependants = new java.util.Vector(1);
    _jspx_dependants.add("/banner.jsp");
  }

  private org.apache.jasper.runtime.ResourceInjector _jspx_resourceInjector;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.apache.jasper.runtime.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n");
      out.write("   \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write('\n');
      out.write("\n");
      out.write("    ");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("       ");
      out.write("\n");
      out.write("         ");
      out.write("<center>\n");
      out.write("        <hr> <br>\n");
      out.write("        <h1><font size=\"+3\" color=\"#CC0066\">Duke's </font>\n");
      out.write("        <img src=\"/bookstore/duke.books.gif\" alt=\"Duke holding books\">\n");
      out.write("        <font size=\"+3\" color=\"black\">Bookstore</font></h1></center><br>\n");
      out.write("        <hr>\n");
      out.write("        <br>\n");
      out.write("\n");
      out.write("\n");
      out.write("        ");
 String bookId=request.getParameter("bookId");
         Book book=bookDB.getBook(bookId);
          
      out.write("\n");
      out.write("         <h2>");
      out.print( book.getTitle() );
      out.write("</h2>\n");
      out.write("                        Por<em>\n");
      out.write("                        ");
      out.print( book.getFirstName() +" " +book.getSurname() );
      out.write("\n");
      out.write("                       </em>");
      out.print( book.getYear() );
      out.write("\n");
      out.write("                        <br><br><h4>\n");
      out.write("                         DEscripcion </h4>\n");
      out.write("                        <blockquote> ");
      out.print( book.getDescription() );
      out.write(" </blockquote>\n");
      out.write("                        <h4>\n");
      out.write("                        Precio ");
      out.print( book.getPrice() );
      out.write("</h4><p><strong><a href=\"servlet\">\n");
      out.write("                        Agregar a carrito</a></strong>\n");
      out.write("                            <strong><a href=\"otro servlet\">Continuar comprando\n");
      out.write("                        </a></strong></p>\n");
      out.write("\n");
      out.write("\n");
      out.write("       ");
      out.write("\n");
      out.write("\n");
      out.write("       \n");
      out.write("       ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("       ");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
