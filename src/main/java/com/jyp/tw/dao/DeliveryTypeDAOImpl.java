package com.jyp.tw.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jyp.tw.vo.DeliveryType;

@Repository
public class DeliveryTypeDAOImpl implements DeliveryTypeDAO {

	@Autowired
	private SqlSession session;
	
	//21-03-03 16:33 양성룡 상품1개의 배송정보 가져오기
		@Override
		public DeliveryType selectOne(int no) {
			return session.selectOne("deliveryType.selectOne",no);
		}
		@Override
		public int insert(DeliveryType deliveryType) {
			return session.insert("deliveryType.insert", deliveryType);
		}
}
