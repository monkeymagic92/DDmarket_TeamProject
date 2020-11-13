package com.dandi.ddmarket.trans.model;

public class TransCmtDMI extends TransCmtVO {
	private int i_trans;
	private String profile_img;
	private String saleProfile_img;
	private String buyNick;
	private String buyI_user;
	private String buyProfile_img;
	
	

	public int getI_trans() {
		return i_trans;
	}

	public void setI_trans(int i_trans) {
		this.i_trans = i_trans;
	}

	public String getBuyProfile_img() {
		return buyProfile_img;
	}

	public void setBuyProfile_img(String buyProfile_img) {
		this.buyProfile_img = buyProfile_img;
	}

	public String getBuyI_user() {
		return buyI_user;
	}

	public void setBuyI_user(String buyI_user) {
		this.buyI_user = buyI_user;
	}

	public String getBuyNick() {
		return buyNick;
	}

	public void setBuyNick(String buyNick) {
		this.buyNick = buyNick;
	}

	public String getSaleProfile_img() {
		return saleProfile_img;
	}

	public void setSaleProfile_img(String saleProfile_img) {
		this.saleProfile_img = saleProfile_img;
	}

	public String getProfile_img() {
		return profile_img;
	}

	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	
	

}
