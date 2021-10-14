package com.jyp.tw.dao;

import java.util.List;

import com.jyp.tw.vo.Category;

public interface CategoryDAO {
	
	//카테고리 추가
		public int insert(Category category);
		
		//카테고리 불러오기
		public List<Category> selectList();
}
