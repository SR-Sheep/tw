package com.jyp.tw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jyp.tw.vo.Category;

@Repository
public class CategoryDAOImpl implements CategoryDAO {

	@Autowired
	private SqlSession session;
	
	@Override
	public int insert(Category category) {
		System.out.println(category.getName());
		return session.insert("category.insert", category);
	}
	
	@Override
	public List<Category> selectList() {
		return session.selectList("category.selectList");
	}
}
