package com.dandi.ddmarket.board.model;

public class BoardDMI extends BoardVO {
	
	private String user_nm;
	private String nick;
	private String category_nm;
	private String cg_nm;
	private int tolike;
	private int is_tolike;
	private double grade;
	private String profile_img;
	private double rating;
	private int i_buyList;
	private int reviewCnt;
	
	
	
	public int getReviewCnt() {
		return reviewCnt;
	}
	public void setReviewCnt(int reviewCnt) {
		this.reviewCnt = reviewCnt;
	}
	public int getI_buyList() {
		return i_buyList;
	}
	public void setI_buyList(int i_buyList) {
		this.i_buyList = i_buyList;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public String getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	public double getGrade() {
		return grade;
	}
	public void setGrade(double grade) {
		this.grade = grade;
	}
	public int getIs_tolike() {
		return is_tolike;
	}
	public void setIs_tolike(int is_tolike) {
		this.is_tolike = is_tolike;
	}
	public int getTolike() {
		return tolike;
	}
	public void setTolike(int tolike) {
		this.tolike = tolike;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getUser_nm() {
		return user_nm;
	}
	public void setUser_nm(String user_nm) {
		this.user_nm = user_nm;
	}
	public String getCategory_nm() {
		return category_nm;
	}
	public void setCategory_nm(String category_nm) {
		this.category_nm = category_nm;
	}
	public String getCg_nm() {
		return cg_nm;
	}
	public void setCg_nm(String cg_nm) {
		this.cg_nm = cg_nm;
	}
	
	
}
