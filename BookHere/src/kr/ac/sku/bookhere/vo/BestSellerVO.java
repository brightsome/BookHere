package kr.ac.sku.bookhere.vo;

public class BestSellerVO {
	String rank;
	String img;
	String title;
	String info;
	String barcode;

	@Override
	public String toString() {
		return "BestSellerVO [rank=" + rank + ", img=" + img + ", title=" + title + ", info=" + info + ", barcode="
				+ barcode + "]";
	}

	public String getBarcode() {
		return barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	
}
