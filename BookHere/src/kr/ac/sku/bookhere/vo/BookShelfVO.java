package kr.ac.sku.bookhere.vo;

public class BookShelfVO {

	private String id;
	private String likecount;
	private String isbn;
	private String bookname;
	private String pic;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLikecount() {
		return likecount;
	}
	public void setLikecount(String likecount) {
		this.likecount = likecount;
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
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	@Override
	public String toString() {
		return "BookShelfVO [id=" + id + ", likecount=" + likecount + ", isbn="
				+ isbn + ", bookname=" + bookname + ", pic=" + pic + "]";
	}
	
	
	
	
	
}
