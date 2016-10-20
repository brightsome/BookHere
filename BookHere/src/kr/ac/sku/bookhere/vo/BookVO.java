package kr.ac.sku.bookhere.vo;

public class BookVO {
   String isbn;
   String bookname;
   String author;
   String publisher;
   int bookprice;
   String bookintro;
   int saleprice;
   String prodid;
   String bookcd;
   String img;
   
   public String getImg() {
	return img;
}
public void setImg(String img) {
	this.img = img;
}
public String getIsbn() {
      return isbn;
   }
   public void setIsbn(String isbn) {
      this.isbn = isbn;
   }
   public String getBookname() {
      return bookname;
   }
   public void setBookname(String bookname) {
      this.bookname = bookname;
   }
   public String getAuthor() {
      return author;
   }
   public void setAuthor(String author) {
      this.author = author;
   }
   public String getPublisher() {
      return publisher;
   }
   public void setPublisher(String publisher) {
      this.publisher = publisher;
   }
   public int getBookprice() {
      return bookprice;
   }
   public void setBookprice(int bookprice) {
      this.bookprice = bookprice;
   }
   public String getBookintro() {
      return bookintro;
   }
   public void setBookintro(String bookintro) {
      this.bookintro = bookintro;
   }
   public int getSaleprice() {
      return saleprice;
   }
   public void setSaleprice(int saleprice) {
      this.saleprice = saleprice;
   }
   public String getProdid() {
      return prodid;
   }
   public void setProdid(String prodid) {
      this.prodid = prodid;
   }
   public String getBookcd() {
      return bookcd;
   }
   public void setBookcd(String bookcd) {
      this.bookcd = bookcd;
   }
@Override
public String toString() {
	return "BookVO [isbn=" + isbn + ", bookname=" + bookname + ", author="
			+ author + ", publisher=" + publisher + ", bookprice=" + bookprice
			+ ", bookintro=" + bookintro + ", saleprice=" + saleprice
			+ ", prodid=" + prodid + ", bookcd=" + bookcd + ", img=" + img
			+ "]";
}
   
   
}