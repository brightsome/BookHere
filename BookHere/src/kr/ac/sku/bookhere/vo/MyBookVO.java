package kr.ac.sku.bookhere.vo;

public class MyBookVO {
	private String id; 
	private String isbn;
	private String memo;
	private String mdate;
	private int star;


	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
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
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	
	@Override
	public String toString() {
		return "MyBookVO [id=" + id + ", isbn=" + isbn + ", memo=" + memo
				+ ", mdate=" + mdate
				+ ", disclose="+ "]";
	}
	
	
}
