/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package cursojava.bookstore.database;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

/**
 *
 * @author zanty
 */
public class ShoppingCart {
    HashMap<String, ShoppingCartItem> items = null;
    int numberOfItems = 0;

    public ShoppingCart() {
        items = new HashMap<String, ShoppingCartItem>();
    }

    public synchronized void add(
        String bookId,
        Book book) {
        if (items.containsKey(bookId)) {
            ShoppingCartItem scitem = (ShoppingCartItem) items.get(bookId);
            scitem.incrementQuantity();
        } else {
            ShoppingCartItem newItem = new ShoppingCartItem(book);
            items.put(bookId, newItem);
        }
    }

    public synchronized void remove(String bookId) {
        if (items.containsKey(bookId)) {
            ShoppingCartItem scitem = (ShoppingCartItem) items.get(bookId);
            scitem.decrementQuantity();

            if (scitem.getQuantity() <= 0) {
                items.remove(bookId);
            }

            numberOfItems--;
        }
    }

    public synchronized List<ShoppingCartItem> getItems() {
        List<ShoppingCartItem> results = new ArrayList<ShoppingCartItem>();
        results.addAll(this.items.values());

        return results;
    }

    protected void finalize() throws Throwable {
        items.clear();
    }

    public synchronized int getNumberOfItems() {
        numberOfItems = 0;

        for (Iterator i = getItems()
                              .iterator(); i.hasNext();) {
            ShoppingCartItem item = (ShoppingCartItem) i.next();
            numberOfItems += item.getQuantity();
        }

        return numberOfItems;
    }

    public synchronized double getTotal() {
        double amount = 0.0;

        for (Iterator i = getItems()
                              .iterator(); i.hasNext();) {
            ShoppingCartItem item = (ShoppingCartItem) i.next();
            Book bookDetails = (Book) item.getItem();

            amount += (item.getQuantity() * bookDetails.getPrice());
        }

        return roundOff(amount);
    }

    private double roundOff(double x) {
        long val = Math.round(x * 100); // cents

        return val / 100.0;
    }

    public synchronized void clear() {
        System.err.println("Clearing cart.");
        items.clear();
        numberOfItems = 0;
    }
}
