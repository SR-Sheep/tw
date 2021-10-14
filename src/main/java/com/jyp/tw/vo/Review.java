package com.jyp.tw.vo;

import java.sql.Timestamp;
import java.util.List;

public class Review {

	private int no, orderNo, score, reviewNum;
	private String content, blind;
	private Timestamp regdate;
	// 21-03-04 14:29 양성룡 한 상품의 리뷰내용 들고 오기
	private Timestamp reciveDate;
	private int count, productNo, optionNo, paymentNo;
	private String optionName, name, profile;
	private List<ReviewImage> reviewImages;
	// 0303 오세훈(관리자 리뷰목록) 멤버필드+getter,setter
	private int memberNo, replyReivewNo;
	private String productName, memberId, replyContents;
	//21-03-25 19:31 양성룡 페이징 처리
	private int start,end;
	
	public Review(int page,int numPage) {
		this.end=page*numPage;
		this.start=end-numPage+1;
	}

	public Review() {
		// TODO Auto-generated constructor stub
	}

	// 0302혁진 작성
	public int getReviewNum() {
		return reviewNum;
	}

	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getBlind() {
		return blind;
	}

	public void setBlind(String blind) {
		this.blind = blind;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public Timestamp getReciveDate() {
		return reciveDate;
	}

	public void setReciveDate(Timestamp reciveDate) {
		this.reciveDate = reciveDate;
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

	public String getOptionName() {
		return optionName;
	}

	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getReplyReivewNo() {
		return replyReivewNo;
	}

	public void setReplyReivewNo(int replyReivewNo) {
		this.replyReivewNo = replyReivewNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getReplyContents() {
		return replyContents;
	}

	public void setReplyContents(String replyContents) {
		this.replyContents = replyContents;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public List<ReviewImage> getReviewImages() {
		return reviewImages;
	}

	public void setReviewImages(List<ReviewImage> reviewImages) {
		this.reviewImages = reviewImages;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}
	

}
