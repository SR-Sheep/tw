package com.jyp.tw.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class OrderProd {

	private int no, count, productNo, optionNo, paymentNo,price;
	private String receiver, address, addressDetail, request, deliveryState, waybill,representImg, name;
	private Date receiveDate;
	private Timestamp regdate;
	
	//김정석 변수 추가
		private String prodName, prodOptName, prodImg, delState;
	
	public OrderProd() {
		// TODO Auto-generated constructor stub
	}

	
	public String getProdName() {
		return prodName;
	}


	public void setProdName(String prodName) {
		this.prodName = prodName;
	}


	public String getProdOptName() {
		return prodOptName;
	}


	public void setProdOptName(String prodOptName) {
		this.prodOptName = prodOptName;
	}


	public String getProdImg() {
		return prodImg;
	}


	public void setProdImg(String prodImg) {
		this.prodImg = prodImg;
	}


	public String getDelState() {
		return delState;
	}


	public void setDelState(String delState) {
		this.delState = delState;
	}


	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
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

	

	public int getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public String getDeliveryState() {
		return deliveryState;
	}

	public void setDeliveryState(String deliveryState) {
		this.deliveryState = deliveryState;
	}

	public String getWaybill() {
		return waybill;
	}

	public void setWaybill(String waybill) {
		this.waybill = waybill;
	}

	public Date getReceiveDate() {
		return receiveDate;
	}

	public void setReceiveDate(Date receiveDate) {
		this.receiveDate = receiveDate;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
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
	
}
