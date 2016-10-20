package kr.ac.sku.bookhere.vo;

public class MyWishVO {
	private String id; 
	private String isbn;
	
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
	@Override
	public String toString() {
		return "MyWishVO [id=" + id + ", isbn=" + isbn
				+ "]";
	}

}
