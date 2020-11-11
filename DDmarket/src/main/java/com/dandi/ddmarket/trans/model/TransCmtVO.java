package com.dandi.ddmarket.trans.model;

public class TransCmtVO {
	private int i_trans_cmt;
	
	private int i_board;
	private int i_user;
	private int saleI_user;
	private String transCmt;
	private int transCmtChk;
	private String r_dt;
	private String m_dt;
	
	public int getI_trans_cmt() {
		return i_trans_cmt;
	}
	public void setI_trans_cmt(int i_trans_cmt) {
		this.i_trans_cmt = i_trans_cmt;
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
	public int getSaleI_user() {
		return saleI_user;
	}
	public void setSaleI_user(int saleI_user) {
		this.saleI_user = saleI_user;
	}
	public String getTransCmt() {
		return transCmt;
	}
	public void setTransCmt(String transCmt) {
		this.transCmt = transCmt;
	}
	public int getTransCmtChk() {
		return transCmtChk;
	}
	public void setTransCmtChk(int transCmtChk) {
		this.transCmtChk = transCmtChk;
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
