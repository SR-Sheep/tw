package com.jyp.tw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jyp.tw.dao.DeliveryDAO;
import com.jyp.tw.vo.Delivery;

@Service
public class DeliveryServiceImpl implements DeliveryService{

	@Autowired
	private DeliveryDAO deliveryDAO;
	
	//21.03.03 18:33 김기현 등록
	@Override
	public List<Delivery> getAddressInfo(int memberNo) {
		return deliveryDAO.selectList(memberNo);
	}
	
	@Override
	public int registerAddress(Delivery delivery) {
		return deliveryDAO.insert(delivery);
	}
	
	//21.03.04 14:58 김기현 등록
	@Override
	public int deleteAddress(int no) {
		return deliveryDAO.delete(no);
	}
	
	//21.03.04 17:36 김기현 등록
	@Override
	public int updateAddress(Delivery delivery) {
		return deliveryDAO.update(delivery);
	}
	
	//21.03.04 18:11 김기현 등록
	@Override
	public Delivery selectOneAddress(Delivery delivery) {
		return deliveryDAO.selectOne(delivery);
	}
	
}
