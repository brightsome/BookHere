package kr.ac.sku.bookhere.vo;

public class MyWishInfoVO {
	private String id; 
	private String isbn;
	private String bookname;
	private String author;
	private String publisher;
	private String img;
	private String bookintro;
	private String count;
	
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getBookintro() {
		return bookintro;
	}
	public void setBookintro(String bookintro) {
		this.bookintro = bookintro;
	}
	@Override
	public String toString() {
		return "MyWishInfoVO [id=" + id + ", isbn=" + isbn + ", bookname="
				+ bookname + ", author=" + author + ", publisher=" + publisher
				+ ", img=" + img + ", bookintro=" + bookintro + ", count="
				+ count + "]";
	}

	
	
}
