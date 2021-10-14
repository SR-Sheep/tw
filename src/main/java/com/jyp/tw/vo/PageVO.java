package com.jyp.tw.vo;

public class PageVO {

	private int start,end,no;
	//21-03-05 08:36 양성룡 상품리스트 필터적용
		private String filter;
	
	public PageVO() {
	}
	
	public PageVO(int page,int numPage) {
		this.end=page*numPage;
		this.start=end-numPage+1;
	}
	public PageVO(int page,int numPage,int no) {
		this.end=page*numPage;
		this.start=end-numPage+1;
		this.no = no;
	}
	
	public int getno() {
		return no;
	}

	public void setno(int no) {
		this.no = no;
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
	
	public String getFilter() {
		return filter;
	}

	public void setFilter(String filter) {
		this.filter = filter;
	}
	
	//21-03-05 08:37 양성룡 페이지 번호와 필터적용을 위한 오버로딩
	public PageVO(int page,int numPage,String filter) {
		this.end=page*numPage;
		this.start=end-numPage+1;
		this.filter = filter;
	}
	
}
