
package com.jyp.tw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jyp.tw.dao.CategoryDAO;
import com.jyp.tw.vo.Category;

@Service
public class CategoryServiceImpl implements CategoryService  {

	@Autowired
	private CategoryDAO categoryDAO;
	
	@Override
	public int addCategory(Category category) {
		return categoryDAO.insert(category);
	}
	
	@Override
	public List<Category> getCategory() {
		return categoryDAO.selectList();
	}
	
}
