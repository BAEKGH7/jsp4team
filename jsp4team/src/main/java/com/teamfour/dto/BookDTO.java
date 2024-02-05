package com.teamfour.dto;

public class BookDTO {
	private String isbn;
	private String bName;
	private Integer bPrice;
	private String writer;
	private String company;
	private String dbate;
	private Integer totalpage;
	private String detail;
	private String category;
	private long stock;
	private String condition;
	private String filename;
	private String bcover;
	private String bindex;
	private String profile;
	
	public String getBcover() {
		return bcover;
	}
	public void setBcover(String bcover) {
		this.bcover = bcover;
	}
	public String getBindex() {
		return bindex;
	}
	public void setBindex(String bindex) {
		this.bindex = bindex;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getbName() {
		return bName;
	}
	public void setbName(String bName) {
		this.bName = bName;
	}
	public Integer getbPrice() {
		return bPrice;
	}
	public void setbPrice(Integer bPrice) {
		this.bPrice = bPrice;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getDbate() {
		return dbate;
	}
	public void setDbate(String dbate) {
		this.dbate = dbate;
	}
	public Integer getTotalpage() {
		return totalpage;
	}
	public void setTotalpage(Integer totalpage) {
		this.totalpage = totalpage;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public long getStock() {
		return stock;
	}
	public void setStock(long stock) {
		this.stock = stock;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
}
