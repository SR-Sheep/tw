package com.jyp.tw.dao;

import com.jyp.tw.vo.Cartlist;

public interface CartlistDAO {
	public int delete(int no);
	
	public int insert(Cartlist cartlist);
	
	public Cartlist selectOne(Cartlist cartlist);
	
	public int insertNoOption(Cartlist cartlist);
	
	public Cartlist selectOneNoOption(Cartlist cartlist);
}
