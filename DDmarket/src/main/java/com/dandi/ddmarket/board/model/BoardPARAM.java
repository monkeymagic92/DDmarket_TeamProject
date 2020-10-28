package com.dandi.ddmarket.board.model;

public class BoardPARAM extends BoardVO{
	
	private String sale_pic;
	private String saler_addr;
	private int i_cg;
	private String cg_nm;
	
	public String getSaler_addr() {
		return saler_addr;
	}
	public void setSaler_addr(String saler_addr) {
		this.saler_addr = saler_addr;
	}

	public String getSale_pic() {
		return sale_pic;
	}
	public void setSale_pic(String sale_pic) {
		this.sale_pic = sale_pic;
	}
	public int getI_cg() {
		return i_cg;
	}
	public void setI_cg(int i_cg) {
		this.i_cg = i_cg;
	}
	public String getCg_nm() {
		return cg_nm;
	}
	public void setCg_nm(String cg_nm) {
		this.cg_nm = cg_nm;
	}
}
