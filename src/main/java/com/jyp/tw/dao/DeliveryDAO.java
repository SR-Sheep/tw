package com.jyp.tw.dao;

import java.util.List;

import com.jyp.tw.vo.Delivery;

public interface DeliveryDAO {
	
	public List<Delivery> selectdeliveryName(int no);
	public Delivery selectBasicDet(int no);
	public Delivery selectDeliveryFillter(Delivery delivery);
	//멤버의 배송지 리스트를 불러오는 메서드 (21.03.03 18:12 김기현 등록)
		public List<Delivery> selectList(int memberNo);
		
		//해당 멤버의 배송지 등록 해주는 메서드
		public int insert(Delivery delivery);
		
		//해당 멤버의 해당 배송지를 삭제해주는 메서드 (21.03.04 14:55 김기현 등록)
		public int delete(int no);
		
		//해당 멤버의 배송지를 수정해주는 메서드 (21.03.04 17:33 김기현 등록)
		public int update(Delivery delivery);
		
		//해당 멤버의 해당 배송지의 정보를 가져오는 메서드 (21.03.04 18:09 김기현 등록)
		public Delivery selectOne(Delivery delivery);
}
