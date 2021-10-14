package com.jyp.tw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jyp.tw.vo.Contents;

@Repository
public class ContentsDAOImpl implements ContentsDAO {
	
	@Autowired
	private SqlSession session;
	
	
	@Override
	public Contents selectContent(int no) {
		
		return session.selectOne("contents.selectContent",no);
	}
	@Override
	public int selectTotalContents() {
		return session.selectOne("contents.selectTotalContents");
	}
	
	@Override
	public int selectOnContents() {
		return session.selectOne("contents.selectOnContents");
	}
	
	@Override
	public List<Contents> selectContentsList() {
		return session.selectList("selectContentsList");
	}
}
