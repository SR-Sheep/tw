package com.jyp.tw.vo;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class ProductFilter {
	private String[] keywords;
	private Date fromDate,toDate;
	
	public String[] getKeywords() {
		return keywords;
	}

	public void setKeywords(String[] keywords) {
		System.out.println(keywords);
		if(keywords!=null) {
			if(keywords.length!=0) {
				for (int i=0; i<keywords.length; i++) {
					keywords[i] = "%"+keywords[i]+"%";
				}
			}else {
				keywords=null;
			}
		}
		this.keywords = keywords;
	}

	public Date getFromDate() {
		return fromDate;
	}
	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}
	public Date getToDate() {
		return toDate;
	}
	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}
	
	public ProductFilter() {
		// TODO Auto-generated constructor stub
	}
	
}
