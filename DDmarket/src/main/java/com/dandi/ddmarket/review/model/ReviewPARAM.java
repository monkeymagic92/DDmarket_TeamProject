package com.dandi.ddmarket.review.model;

public class ReviewPARAM extends ReviewVO {
	
	private String nick;
	private String profile_img;
	private double star;
	
	
	
	public double getStar() {
		return star;
	}

	public void setStar(double star) {
		this.star = star;
	}

	public String getProfile_img() {
		return profile_img;
	}

	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}
	
}
