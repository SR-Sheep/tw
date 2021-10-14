package com.jyp.tw.dao;

import com.jyp.tw.vo.DeliveryType;

public interface DeliveryTypeDAO {
	
	//21-03-03 16:33 양성룡 상품1개의 배송정보 가져오기
		public DeliveryType selectOne(int no);
		
		public int insert(DeliveryType deliveryType);
}
