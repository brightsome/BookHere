package kr.ac.sku.bookhere.vo;

public class RecommendVO {
	private String id; 
	private int count;
	private String pic;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	@Override
	public String toString() {
		return "RecommendVO [id=" + id + ", count=" + count + ", pic=" + pic
				+ "]";
	}
	
	
	
}
