package com.jyp.tw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jyp.tw.vo.ProdOption;

@Repository
public class ProdOptionDAOImpl implements ProdOptionDAO {
	
	@Autowired
	private SqlSession session;
	
	//21-03-03 16:35 양성룡 상품1개의 모든 옵션 가져오기
		@Override
		public List<ProdOption> selectListByProductNo(int productNo) {
			return session.selectList("prodOption.selectListByProductNo",productNo);
		}
}
