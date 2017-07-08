/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package cursojava.bookstore.database;

import cursojava.bookstore.exceptions.BookNotFoundException;
import cursojava.bookstore.exceptions.BooksNotFoundException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author zanty
 */
public class BookDB {
     List books;

     public BookDB(){
        books=new ArrayList();
          Book book1=new Book("101","Perez","Arturo","El Asedio",30.13f,true,2010,"Una novela que te tiene en jaque hasta el final",20);
          Book book2=new Book("102","Silva","Lorenzo","La Estrategia del Agua",24.78f,true,2010,"Un nuevo casodeBivilacqua y Chamorro, tras cuatro años de espera",10);
          Book book3=new Book("103","León","Felipe","Resumen del cuaderno verde del che",15.00f,true,2007,"Los tres ofiicales con uniforme de rangers y el agente de la CIA, revisaron la mochila minuciosamente ...",6);
          Book book4=new Book("104","Mallon","Brenda","Los Sueños",37.00f,true,2006,"Sus sueños son importantes. Aprenda a utilizarlos",8);
          Book book5=new Book("105","Baricco","Alessandro","Tierras de Cristal",29.14f,true,2009,"Casi al modo cervantino, entre el humor y la melancolía",20);
          
          books.add(book1);
          books.add(book2);
          books.add(book3);
          books.add(book4);
          books.add(book5);
     }
     public List getBooks() throws BooksNotFoundException {
        try {
          return books;
        } catch (Exception ex) {
            throw new BooksNotFoundException(
                    "Could not get books: " + ex.getMessage());
        }
    }

     public Book getBook(String bookId) throws BookNotFoundException {
         Iterator it=books.iterator();
         Book requestedBook=null;
         while (it.hasNext()) {
             Book bookTmp = (Book)it.next();
             if(bookTmp.getBookId().compareTo(bookId)==0)
             {
                requestedBook=bookTmp;
                break;
             }
         }
        if (requestedBook == null) {
            throw new BookNotFoundException("Couldn't find book: " + bookId);
        }
         return requestedBook;
    }

      public void buyBooks(ShoppingCart cart) {
        Collection items = cart.getItems();
        Iterator i = items.iterator();

      
            while (i.hasNext()) {
                ShoppingCartItem sci = (ShoppingCartItem) i.next();
                Book bd = (Book) sci.getItem();
                String id = bd.getBookId();
                int quantity = sci.getQuantity();
                buyBook(id, quantity);
            }
          }

    public void buyBook(
        String bookId,
        int quantity) {
        
            Book requestedBook=null;
        try {
            requestedBook = getBook(bookId);
        } catch (BookNotFoundException ex) {
           ex.printStackTrace();
        }

            if (requestedBook != null) {
                int inventory = requestedBook.getInventory();

                if ((inventory - quantity) >= 0) {
                    int newInventory = inventory - quantity;
                    requestedBook.setInventory(newInventory);
                }  
            }
        } 
    
}
