package com.jyp.tw.dao;

import com.jyp.tw.vo.Discount;

public interface DiscountDAO {
	
	//21-03-03 16:30 양성룡 상품1개의 할인정보 가져오기
		public Discount selectOne(int no);
		public int insert(Discount discount);

}
