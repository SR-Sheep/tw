package com.jyp.tw.dao;

import com.jyp.tw.vo.DeliveryInfo;

public interface DeliveryInfoDAO {
	
	public int insert(DeliveryInfo deliveryInfo);
	public int selectCount(int no);
	public DeliveryInfo selectDelivery(int cartNo);
	public int delete(int cartNo);
}
