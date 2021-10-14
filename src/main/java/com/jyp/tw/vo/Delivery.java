package com.jyp.tw.vo;

import java.sql.Timestamp;

public class Delivery {
	private int no, memberNo;
	private String name, receiver, address, addressDetail, phone, baseDet, postcode;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBaseDet() {
		return baseDet;
	}
	public void setBaseDet(String baseDet) {
		this.baseDet = baseDet;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	//21.03.04 11:44 김기현 작성
		public String getFullPhone() {
			return getPhone1()+"-"+getPhone2()+"-"+getPhone3();
		}
		public String getPhone1() {
			return phone.substring(0,3);
		}
		public String getPhone2() {
			return phone.substring(3,phone.length()-4);
		}
		public String getPhone3() {
			return phone.substring(phone.length()-4,phone.length());
		}
	
	public Delivery() {
		// TODO Auto-generated constructor stub
	}
}
