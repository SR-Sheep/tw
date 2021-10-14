package com.jyp.tw.vo;

import java.sql.Timestamp;

public class Product {
	
	private int no, price, stock, saleCount, discountRate,deliveryPrice,deliveryOption,count,cartListNo,optionNo;
	private String name, representImg, deliveryType,optionName;
	private Timestamp regdate;
	private int reviewCount;//21-03-04 11:58 양성룡 한 상품의 리뷰 카운트를 가져오기 위해 선언
	private float score;//21-03-05 06:29 양성룡 상품의 평점을 가져오기 위해 선언
	
	public Product() {
		// TODO Auto-generated constructor stub
	}
	
	
	//0302 혁진작성
	public int getDiscountRate() {
		return discountRate;
	}
	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}
	//0303 혁진작성
	public int getDeliveryPrice() {
		return deliveryPrice;
	}
	public void setDeliveryPrice(int deliveryPrice) {
		this.deliveryPrice = deliveryPrice;
	}
	public String getOptionName() {
		return optionName;
	}
	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}
	public int getDeliveryOption() {
		return deliveryOption;
	}
	public void setDeliveryOption(int deliveryOption) {
		this.deliveryOption = deliveryOption;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getCartListNo() {
		return cartListNo;
	}
	public void setCartListNo(int cartListNo) {
		this.cartListNo = cartListNo;
	}
	public int getOptionNo() {
		return optionNo;
	}
	public void setOptionNo(int optionNo) {
		this.optionNo = optionNo;
	}


	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getSaleCount() {
		return saleCount;
	}

	public void setSaleCount(int saleCount) {
		this.saleCount = saleCount;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRepresentImg() {
		return representImg;
	}

	public void setRepresentImg(String representImg) {
		this.representImg = representImg;
	}

	public String getDeliveryType() {
		return deliveryType;
	}

	public void setDeliveryType(String deliveryType) {
		this.deliveryType = deliveryType;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	public int getReviewCount() {
		return reviewCount;
	}


	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}


	public float getScore() {
		//평점을 반올림하여 소수점 첫번째자리까지만 출력
		return Math.round(score*10)/10;
	}


	public void setScore(float score) {
		this.score = score;
	}
	
}
