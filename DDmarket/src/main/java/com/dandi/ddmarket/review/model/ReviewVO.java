package com.dandi.ddmarket.review.model;

public class ReviewVO {
	private int i_review;
	private int i_board;
	private int i_user;
	private String ctnt;
	private double rating;
	
	public int getI_review() {
		return i_review;
	}
	public void setI_review(int i_review) {
		this.i_review = i_review;
	}
	public int getI_board() {
		return i_board;
	}
	public void setI_board(int i_board) {
		this.i_board = i_board;
	}
	public int getI_user() {
		return i_user;
	}
	public void setI_user(int i_user) {
		this.i_user = i_user;
	}
	public String getCtnt() {
		return ctnt;
	}
	public void setCtnt(String ctnt) {
		this.ctnt = ctnt;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	
	
}
