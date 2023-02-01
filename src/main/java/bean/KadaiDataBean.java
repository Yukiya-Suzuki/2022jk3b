package bean;

import java.io.Serializable;

public class KadaiDataBean implements Serializable{
	private static final long serialVesionUID = 1L;
	
	private int id;
	private int status;
	private String statusEnterDate;
	private String name;
	private String furigana;
	private String birth;
	private String postNumber;
	private String address;
	private String tellNumber;
	private String mail;
	private String parentName;
	private String parentFurigana;
	private String parentPostNumber;
	private String parentAddress;
	private String parentTellNumber;
	private String parentMail;
	
	public void setId(int id) {
		this.id = id;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public void setStatusEnterDate(String statusEnterDate) {
		this.statusEnterDate = statusEnterDate;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setFurigana(String furigana) {
		this.furigana = furigana;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public void setPostNumber(String postNumber) {
		this.postNumber = postNumber;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setTellNumber(String tellNumber) {
		this.tellNumber = tellNumber;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
	public void setParentFurigana(String parentFurigana) {
		this.parentFurigana = parentFurigana;
	}
	public void setParentPostNumber(String parentPostNumber) {
		this.parentPostNumber = parentPostNumber;
	}
	public void setParentAddress(String parentAddress) {
		this.parentAddress = parentAddress;
	}
	public void setParentTellNumber(String parentTellNumber) {
		this.parentTellNumber = parentTellNumber;
	}
	public void setParentMail(String parentMail) {
		this.parentMail = parentMail;
	}
	
	public int getId() {
		return id;
	}
	public int getStatus() {
		return status;
	}
	public String getStatusEnterDate() {
		return statusEnterDate;
	}
	public String getName() {
		return name;
	}
	public String getFurigana() {
		return furigana;
	}
	public String getBirth() {
		return birth;
	}
	public String getPostNumber() {
		return postNumber;
	}
	public String getAddress() {
		return address;
	}
	public String getTellNumber() {
		return tellNumber;
	}
	public String getMail() {
		return mail;
	}
	public String getParentName() {
		return parentName;
	}
	public String getParentFurigana() {
		return parentFurigana;
	}
	public String getParentPostNumber() {
		return parentPostNumber;
	}
	public String getParentAddress() {
		return parentAddress;
	}
	public String getParentTellNumber() {
		return parentTellNumber;
	}
	public String getParentMail() {
		return parentMail;
	}
}