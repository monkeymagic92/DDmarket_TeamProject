package com.dandi.ddmarket.cmt.model;

public class CmtVO {
	private int i_cmt;
	private int i_user;
	private int i_board;
	private String ctnt;
	private int scr;
	private String r_dt;
	private String m_dt;
	
	public int getI_cmt() {
		return i_cmt;
	}
	public void setI_cmt(int i_cmt) {
		this.i_cmt = i_cmt;
	}
	public int getI_user() {
		return i_user;
	}
	public void setI_user(int i_user) {
		this.i_user = i_user;
	}
	public int getI_board() {
		return i_board;
	}
	public int getScr() {
		return scr;
	}
	public void setScr(int scr) {
		this.scr = scr;
	}
	public void setI_board(int i_board) {
		this.i_board = i_board;
	}
	public String getCtnt() {
		return ctnt;
	}
	public void setCtnt(String ctnt) {
		this.ctnt = ctnt;
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
