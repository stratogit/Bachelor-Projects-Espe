/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package cursojava.test;

import cursojava.bookstore.database.Book;
import cursojava.bookstore.database.BookDB;
import cursojava.bookstore.database.ShoppingCart;
import cursojava.bookstore.database.ShoppingCartItem;
import cursojava.bookstore.exceptions.BookNotFoundException;
import cursojava.bookstore.exceptions.BooksNotFoundException;
import java.util.Iterator;
import java.util.List;

/**
 *
 * @author Java
 */
public class TestBook {
    public static void main (String args[]) throws BookNotFoundException{
        BookDB base = new BookDB();
        try{
            List books = base.getBooks();
/*
            Iterator iter=books.iterator();
            while(iter.hasNext()){ //siempre devuelve object
                Book book=(Book)iter.next();
                System.out.println(book.getTitle()+" "+book.getPrice());
            }

            for(int i=0; i<books.size(); i++) {
                   Book book=(Book)books.get(i);
                 System.out.println(book.getTitle()+" "+book.getPrice());
            }
*/
             for(Object object : books){
                 Book book=(Book)object;
                 System.out.println(book.getTitle()+" "+book.getPrice());

             }

             Book book1=base.getBook("101");
             Book book2=base.getBook("102");


             ShoppingCart cart=new ShoppingCart();
             cart.add(book1.getBookId(),book1);
             cart.add(book2.getBookId(),book2);


             List<ShoppingCartItem> items=cart.getItems();

             for(Object object : items){
                 ShoppingCartItem cari=(ShoppingCartItem)object;
                 Book bookcar=(Book)cari.getItem();
                  System.out.println(bookcar.getDescription());

             }


        }catch(BooksNotFoundException ex){
       
        }

    }

}
