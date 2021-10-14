package com.jyp.tw.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jyp.tw.vo.PointHis;

@Repository
public class PointHisDAOImpl implements PointHisDAO {

	@Autowired
	private SqlSession session;
	
	@Override
	public int insertOrderPoint(PointHis pointHis) {
		return session.insert("pointHis.insertOrderPoint", pointHis);
	}
}
