package com.jyp.tw.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProdCategoryDAOImpl implements ProdCategoryDAO {

	@Autowired
	private SqlSession session;
	
}
