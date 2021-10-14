package com.jyp.tw.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jyp.tw.vo.Discount;

@Repository
public class DiscountDAOImpl implements DiscountDAO {
	
	@Autowired
	private SqlSession session;
	
	//21-03-03 16:31 양성룡 상품1개의 할인정보 가져오기
		@Override
		public Discount selectOne(int no) {
			return session.selectOne("discount.selectOne",no);
		}
		@Override
		public int insert(Discount discount) {
			return session.insert("discount.insert", discount);
		}
}
