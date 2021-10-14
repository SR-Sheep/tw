package com.jyp.tw.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ContentsProdDAOImpl implements ContentsProdDAO {
	
	@Autowired
	private SqlSession session;
}
