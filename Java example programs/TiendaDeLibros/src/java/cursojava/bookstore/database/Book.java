/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package cursojava.bookstore.database;

/**
 *
 * @author zanty
 */
public class Book {
    private String bookId;
    private String description;
    private String firstName;
    private String surname;
    private String title;
    private boolean onSale;
    private float price;
    private int year;
    private int inventory;

    public Book() {
    }

    public Book(
        String bookId,
        String surname,
        String firstName,
        String title,
        float price,
        boolean onSale,
        int year,
        String description,
        int inventory) {
        this.bookId = bookId;
        this.title = title;
        this.firstName = firstName;
        this.surname = surname;
        this.price = price;
        this.onSale = onSale;
        this.year = year;
        this.description = description;
        this.inventory = inventory;
    }

    public String getBookId() {
        return this.bookId;
    }

    public String getTitle() {
        return this.title;
    }

    public String getFirstName() {
        return this.firstName;
    }

    public String getSurname() {
        return this.surname;
    }

    public float getPrice() {
        return this.price;
    }

    public boolean getOnSale() {
        return this.onSale;
    }

    public int getYear() {
        return this.year;
    }

    public String getDescription() {
        return this.description;
    }

    public int getInventory() {
        return this.inventory;
    }

    public void setBookId(String id) {
        this.bookId = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public void setOnSale(boolean onSale) {
        this.onSale = onSale;
    }

    public void setCalendar_year(int calendar_year) {
        this.year = year;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setInventory(int inventory) {
        this.inventory = inventory;
    }
}
