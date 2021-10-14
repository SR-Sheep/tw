package com.jyp.tw.service;

import java.util.List;
import java.util.Map;

import com.jyp.tw.vo.Cartlist;
import com.jyp.tw.vo.DeliveryInfo;
import com.jyp.tw.vo.Payment;
import com.jyp.tw.vo.Product;

public interface OrderService {
	public List<Product> getCartList(int no);
	public Map<String,Object> getDelivery(int no,String name);
	public Map<String, Object> getDelivery(Product product);
	public int registerDeliveryInfo(DeliveryInfo deliveryInfo);
	public String order(String[] cartNo, String[] optionNo,int sumPrice,int no,String count[],String prodNum[]);
	//주문 내역
	public List<Payment> getOrders(int memberNo);
	public Map<String, Object> getOrderPage(int page, int memberNo);
	
	//장바구니 추가
	public int addCart(Cartlist cartlist);
}
