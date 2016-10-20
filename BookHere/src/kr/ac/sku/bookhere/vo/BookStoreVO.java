package kr.ac.sku.bookhere.vo;

import org.springframework.web.multipart.MultipartFile;

public class BookStoreVO {
	private MultipartFile bookstorefile;
	private MultipartFile fileattach;
	private int branchid;
	private String storename;
	private String branchname;
	private String latitude;
	private String longitude;
	private String address;
	private String phonenum;
	private String website;
	private String pic;

	public MultipartFile getBookstorefile() {
		return bookstorefile;
	}

	public void setBookstorefile(MultipartFile bookstorefile) {
		this.bookstorefile = bookstorefile;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public MultipartFile getFileattach() {
		return fileattach;
	}

	public void setFileattach(MultipartFile fileattach) {
		this.fileattach = fileattach;
	}

	public int getBranchid() {
		return branchid;
	}

	public void setBranchid(int branchid) {
		this.branchid = branchid;
	}

	public String getStorename() {
		return storename;
	}

	public void setStorename(String storename) {
		this.storename = storename;
	}

	public String getBranchname() {
		return branchname;
	}

	public void setBranchname(String branchname) {
		this.branchname = branchname;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhonenum() {
		return phonenum;
	}

	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;

	}

	@Override
	public String toString() {
		return "BookStoreVO [branchid=" + branchid + ", storename=" + storename + ", branchname=" + branchname
				+ ", latitude=" + latitude + ", longitude=" + longitude + ", address=" + address + ", phonenum="
				+ phonenum + ", website=" + website + "]";
	}
}