package com.jyp.tw.vo;

import java.sql.Timestamp;

public class Cartlist {
	private int no, memberNo, productNo, optionNo, count;
	private Timestamp regdate;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getOptionNo() {
		return optionNo;
	}
	public void setOptionNo(int optionNo) {
		this.optionNo = optionNo;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	public Cartlist(int memberNo, int productNo, int optionNo, int count) {
		this.memberNo = memberNo;
		this.productNo = productNo;
		this.optionNo = optionNo;
		this.count = count;
	}
	public Cartlist() {
		// TODO Auto-generated constructor stub
	}
}
