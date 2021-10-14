package com.jyp.tw.service;

import java.util.List;

import com.jyp.tw.vo.Delivery;

public interface DeliveryService {

	//멤버의 배송지정보를 얻어오는 메서드 (21.03.03 18:33 김기현 등록)
	public List<Delivery> getAddressInfo(int memberNo);
	
	//해당 멤버의 배송지 등록
	public int registerAddress(Delivery delivery);
	
	//해당 멤버의 배송지 삭제(21.03.04 14:56 김기현 등록)
	public int deleteAddress(int no);
	
	//해당 멤버의 배송지 수정(21.03.04 17:35 김기현 등록)
	public int updateAddress(Delivery delivery);
	
	//해당 멤버의 해당 배송지 정보 (21.03.04 18:11 김기현 등록)
	public Delivery selectOneAddress(Delivery delivery);
}
