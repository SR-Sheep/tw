package com.jyp.tw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jyp.tw.vo.Delivery;

@Repository
public class DeliveryDAOImpl implements DeliveryDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Delivery> selectdeliveryName(int no) {
		return sqlSession.selectList("delivery.selectdeliveryName",no);
	}
	@Override
	public Delivery selectBasicDet(int no) {
		
		return sqlSession.selectOne("delivery.selectBasicDet", no);
	}
	@Override
	public Delivery selectDeliveryFillter(Delivery delivery) {
		return sqlSession.selectOne("delivery.selectDeliveryFillter", delivery);
	}
	//21.03.03 18:12 김기현 등록
		@Override
		public List<Delivery> selectList(int memberNo) {
			return sqlSession.selectList("delivery.selectList",memberNo);
		}
		
		//21.03.04 14:14 김기현 등록
		@Override
		public int insert(Delivery delivery) {
			return sqlSession.insert("delivery.insert", delivery);
		}
		
		//21.03.04 14:56 김기현 등록
		@Override
		public int delete(int no) {
			return sqlSession.delete("delivery.delete", no);
		}
		
		//21.03.04 17:34 김기현 등록
		@Override
		public int update(Delivery delivery) {
			return sqlSession.delete("delivery.update", delivery);
		}
		
		//21.03.04 18:09 김기현 등록
		@Override
		public Delivery selectOne(Delivery delivery) {
			return sqlSession.selectOne("delivery.selectOne", delivery);
		}
}
