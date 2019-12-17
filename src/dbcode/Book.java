package dbcode;

import java.sql.Date;

public class Book {
   private int book_id;
   private String book_name;
   private String img_url;
   private String author;
   private String publiser;
   private Date publication_date;
   private String gname;
   private int left_book;
   private int price;

   public Book() {
      book_id = -1;
      book_name = null;
      img_url = null;
      author = null;
      publiser = null;
      publication_date = null;
      gname = null;
      left_book = -1;
      price = -1;
      }

   public Book(int book_id, String book_name, String img_url, String author, String publiser, Date publication_date,
         String gname, int left_book, int price) {
      super();
      this.book_id = book_id;
      this.book_name = book_name;
      this.img_url = img_url;
      this.author = author;
      this.publiser = publiser;
      this.publication_date = publication_date;
      this.gname = gname;
      this.left_book = left_book;
      this.price = price;
   }

   @Override
   public String toString() {
      return "Book [book_id=" + book_id + ", book_name=" + book_name + ", img_url=" + img_url + ", author=" + author
            + ", publiser=" + publiser + ", publication_date=" + publication_date + ", gname=" + gname
            + ", left_book=" + left_book + ", price=" + price + "]";
   }

   public int getBook_id() {
      return book_id;
   }

   public void setBook_id(int book_id) {
      this.book_id = book_id;
   }

   public String getBook_name() {
      return book_name;
   }

   public void setBook_name(String book_name) {
      this.book_name = book_name;
   }

   public String getImg_url() {
      return img_url;
   }

   public void setImg_url(String img_url) {
      this.img_url = img_url;
   }

   public String getAuthor() {
      return author;
   }

   public void setAuthor(String author) {
      this.author = author;
   }

   public String getPubliser() {
      return publiser;
   }

   public void setPubliser(String publiser) {
      this.publiser = publiser;
   }

   public Date getPublication_date() {
      return publication_date;
   }

   public void setPublication_date(Date publication_date) {
      this.publication_date = publication_date;
   }

   public String getGname() {
      return gname;
   }

   public void setGname(String gname) {
      this.gname = gname;
   }

   public int getLeft_book() {
      return left_book;
   }

   public void setLeft_book(int left_book) {
      this.left_book = left_book;
   }

   public int getPrice() {
      return price;
   }

   public void setPrice(int price) {
      this.price = price;
   }
   
   
}