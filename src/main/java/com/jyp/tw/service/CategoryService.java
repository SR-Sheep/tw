package com.jyp.tw.service;

import java.util.List;

import com.jyp.tw.vo.Category;

public interface CategoryService {

	//카테고리 추가
	public int addCategory(Category category);
	
	//카테고리 불러오기
	public List<Category> getCategory();
}
