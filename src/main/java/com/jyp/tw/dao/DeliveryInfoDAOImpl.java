package com.jyp.tw.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jyp.tw.vo.DeliveryInfo;

@Repository
public class DeliveryInfoDAOImpl implements DeliveryInfoDAO {

	@Autowired
	private SqlSession session;
	
	@Override
	public int insert(DeliveryInfo deliveryInfo) {
		return session.insert("deliveryInfo.insert", deliveryInfo);
	}
	@Override
	public int selectCount(int no) {
		return session.selectOne("deliveryInfo.selectCount",no);
	}
	@Override
	public DeliveryInfo selectDelivery(int cartNo) {
		// TODO Auto-generated method stub
		return session.selectOne("deliveryInfo.selectDelivery", cartNo);
	}
	@Override
	public int delete(int cartNo) {
		return session.delete("deliveryInfo.delete",cartNo);
	}
}
