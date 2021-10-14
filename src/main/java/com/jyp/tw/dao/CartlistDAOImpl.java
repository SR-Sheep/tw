package com.jyp.tw.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jyp.tw.vo.Cartlist;

@Repository
public class CartlistDAOImpl implements CartlistDAO {

	@Autowired
	private SqlSession session;
	
	@Override
	public int delete(int no) {
		return session.delete("cartlist.delete",no);
	}
	
	@Override
	public int insert(Cartlist cartlist) {
		return session.insert("cartlist.cartInsert",cartlist);
	}
	
	@Override
	public Cartlist selectOne(Cartlist cartlist) {
		return session.selectOne("cartlist.cartSelectOne",cartlist);
	}
	
	@Override
	public int insertNoOption(Cartlist cartlist) {
		return session.insert("cartlist.cartInsertNoOption",cartlist);
	}
	
	@Override
	public Cartlist selectOneNoOption(Cartlist cartlist) {
		return session.selectOne("cartlist.cartSelectOneNoOption",cartlist);
	}
	
}
