package com.jyp.tw.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

public class Payment {

	
	private int no, pointNo, memberNo,price, waybill;
	private String representImg, name;
	private Timestamp regdate;
	private List<OrderProd> orderProds;
	private Date receiveDate;
	
	
	public Payment() {
		// TODO Auto-generated constructor stub
	}
	
	

	public int getPrice() {
		return price;
	}



	public void setPrice(int price) {
		this.price = price;
	}



	public int getWaybill() {
		return waybill;
	}



	public void setWaybill(int waybill) {
		this.waybill = waybill;
	}



	public String getRepresentImg() {
		return representImg;
	}



	public void setRepresentImg(String representImg) {
		this.representImg = representImg;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public List<OrderProd> getOrderProds() {
		return orderProds;
	}



	public void setOrderProds(List<OrderProd> orderProds) {
		this.orderProds = orderProds;
	}



	public Date getReceiveDate() {
		return receiveDate;
	}



	public void setReceiveDate(Date receiveDate) {
		this.receiveDate = receiveDate;
	}



	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public int getPointNo() {
		return pointNo;
	}


	public void setPointNo(int pointNo) {
		this.pointNo = pointNo;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public Timestamp getRegdate() {
		return regdate;
	}


	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
}
