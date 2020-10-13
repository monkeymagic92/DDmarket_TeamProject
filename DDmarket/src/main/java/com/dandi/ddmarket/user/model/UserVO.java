package com.dandi.ddmarket.user.model;

public class UserVO {
	private int i_user;
	private String user_id;
	private String user_pw;
	private String nick;
	private String nm;
	private String email;
	private String post;	// 우편번호
	private String addr;    // 나머지주소
	
	private String favI_cg_1;  // 관심카테고리 
	private String favI_cg_2;
	private String favI_cg_3;
	private double grade;	   // 신용점수
	private String profile_img;
	private String r_dt;
	private String m_dt;
	
	public int getI_user() {
		return i_user;
	}
	public void setI_user(int i_user) {
		this.i_user = i_user;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getNm() {
		return nm;
	}
	public void setNm(String nm) {
		this.nm = nm;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getFavI_cg_1() {
		return favI_cg_1;
	}
	public void setFavI_cg_1(String favI_cg_1) {
		this.favI_cg_1 = favI_cg_1;
	}
	public String getFavI_cg_2() {
		return favI_cg_2;
	}
	public void setFavI_cg_2(String favI_cg_2) {
		this.favI_cg_2 = favI_cg_2;
	}
	public String getFavI_cg_3() {
		return favI_cg_3;
	}
	public void setFavI_cg_3(String favI_cg_3) {
		this.favI_cg_3 = favI_cg_3;
	}
	public double getGrade() {
		return grade;
	}
	public void setGrade(double grade) {
		this.grade = grade;
	}
	public String getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	public String getR_dt() {
		return r_dt;
	}
	public void setR_dt(String r_dt) {
		this.r_dt = r_dt;
	}
	public String getM_dt() {
		return m_dt;
	}
	public void setM_dt(String m_dt) {
		this.m_dt = m_dt;
	}
	
}
