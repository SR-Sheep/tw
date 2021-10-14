package com.jyp.tw.dao;

import java.util.List;

import com.jyp.tw.vo.Contents;

public interface ContentsDAO {
	public Contents selectContent(int no);
	//총 컨텐츠
		public int selectTotalContents();
		
		//보여지는 총 컨텐츠
		public int selectOnContents();
		
		//컨텐츠의 리스트
		public List<Contents> selectContentsList();
}
