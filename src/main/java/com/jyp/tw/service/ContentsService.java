package com.jyp.tw.service;

import java.util.List;

import com.jyp.tw.vo.Contents;

public interface ContentsService {

	public int totalContentsCount();
	
	public int onContentsCount();
	
	public List<Contents> getContentsList();
	
}
