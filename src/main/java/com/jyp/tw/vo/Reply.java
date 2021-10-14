package com.jyp.tw.vo;

import java.sql.Timestamp;

public class Reply {

	private int no, reviewNo, adminNo;
	private String contents;
	private Timestamp regdate;
	
	public Reply() {
		// TODO Auto-generated constructor stub
	}
	
	//0303 오세훈
		public Reply(int reviewNo, String contents, int adminNo) {
			this.reviewNo = reviewNo;
			this.contents = contents;
			this.adminNo = adminNo; 
		}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}
