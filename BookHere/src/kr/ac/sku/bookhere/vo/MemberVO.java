package kr.ac.sku.bookhere.vo;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
	private MultipartFile ufile;
	
	private String id;
	private String name;
	private String password;
	private String phonenumber;
	private String mail;
	private String pic;
	private int likecount;
	private int owner;
	
	public int getOwner() {
		return owner;
	}
	public void setOwner(int owner) {
		this.owner = owner;
	}
	public int getLikecount() {
		return likecount;
	}
	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}
	public MultipartFile getUfile() {
		return ufile;
	}
	public void setUfile(MultipartFile ufile) {
		this.ufile = ufile;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	@Override
	public String toString() {
		return "MemberVO [ufile=" + ufile + ", id=" + id + ", name=" + name
				+ ", password=" + password + ", phonenumber=" + phonenumber
				+ ", mail=" + mail + ", pic=" + pic + "]";
	}
	
	
}
