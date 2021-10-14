package com.jyp.tw.vo;

import java.sql.Timestamp;

public class Contents {
	private int no, countNum,prodCount;
	private String contentImg, title, description,state;
	private Timestamp regdate;
	
	
	//0302 혁진작성
	public int getCountNum() {
		return countNum;
	}
	public void setCountNum(int countNum) {
		this.countNum = countNum;
	}
	
	
	public int getProdCount() {
		return prodCount;
	}
	public void setProdCount(int prodCount) {
		this.prodCount = prodCount;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getContentImg() {
		return contentImg;
	}
	public void setContentImg(String contentImg) {
		this.contentImg = contentImg;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public Contents() {
		// TODO Auto-generated constructor stub
	}
	
}
