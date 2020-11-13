package com.dandi.ddmarket.trans.model;

public class TransVO {
	
	private int i_trans;
	private int i_board;
	private int i_user;
	private int i_room;
	private int saleI_user;
	private int chk;
	private String r_dt;
	private String m_dt;
	
	
	
	public int getSaleI_user() {
		return saleI_user;
	}
	public void setSaleI_user(int saleI_user) {
		this.saleI_user = saleI_user;
	}
	public int getI_trans() {
		return i_trans;
	}
	public void setI_trans(int i_trans) {
		this.i_trans = i_trans;
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
	
	public int getI_room() {
		return i_room;
	}
	public void setI_room(int i_room) {
		this.i_room = i_room;
	}
	public int getChk() {
		return chk;
	}
	public void setChk(int chk) {
		this.chk = chk;
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
