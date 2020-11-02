package com.dandi.ddmarket.board.model;

import java.util.List;

/*
 * 	테이블 완성시 수정해서 다시 빈 추가하기
 */
public class BoardVO {
	private int i_board;
	private int i_cg;
	private int i_user;
	private String title;
	private String ctnt;
	private int seq;	// 사진 포문돌릴 seq
	private String thumImage;
	private String imageFile;	// 따로 Domain으로 빼기 
	private List<BoardVO> imageFileList; // 따로 Domain으로 빼기 
	

	private String image_1;
	private String image_2;
	private String image_3;
	private String image_4;
	private String image_5;
	private String post;
	private String addr;
	private String road;
	private int hits;
	private int price;
	private int sold; // 0이면 거래 미완료, 1이면 거래완료, 2 거래중
	private String r_dt;
	private String m_dt;
	
	
	
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getThumImage() {
		return thumImage;
	}
	public void setThumImage(String thumImage) {
		this.thumImage = thumImage;
	}
	public String getImageFile() {
		return imageFile;
	}
	public void setImageFile(String imageFile) {
		this.imageFile = imageFile;
	}
	public List<BoardVO> getImageFileList() {
		return imageFileList;
	}
	public void setImageFileList(List<BoardVO> imageFileList) {
		this.imageFileList = imageFileList;
	}
	
	public int getI_board() {
		return i_board;
	}
	public void setI_board(int i_board) {
		this.i_board = i_board;
	}
	public int getI_cg() {
		return i_cg;
	}
	public void setI_cg(int i_cg) {
		this.i_cg = i_cg;
	}
	public int getI_user() {
		return i_user;
	}
	public void setI_user(int i_user) {
		this.i_user = i_user;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCtnt() {
		return ctnt;
	}
	public void setCtnt(String ctnt) {
		this.ctnt = ctnt;
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
	public String getRoad() {
		return road;
	}
	public void setRoad(String road) {
		this.road = road;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSold() {
		return sold;
	}
	public void setSold(int sold) {
		this.sold = sold;
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
	public String getImage_1() {
		return image_1;
	}
	public void setImage_1(String image_1) {
		this.image_1 = image_1;
	}
	public String getImage_2() {
		return image_2;
	}
	public void setImage_2(String image_2) {
		this.image_2 = image_2;
	}
	public String getImage_3() {
		return image_3;
	}
	public void setImage_3(String image_3) {
		this.image_3 = image_3;
	}
	public String getImage_4() {
		return image_4;
	}
	public void setImage_4(String image_4) {
		this.image_4 = image_4;
	}
	public String getImage_5() {
		return image_5;
	}
	public void setImage_5(String image_5) {
		this.image_5 = image_5;
	}
			
}
