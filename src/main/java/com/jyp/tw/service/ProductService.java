package com.jyp.tw.service;

import java.util.Map;

import com.jyp.tw.vo.Contents;
import com.jyp.tw.vo.DeliveryType;
import com.jyp.tw.vo.Discount;
import com.jyp.tw.vo.Product;
import com.jyp.tw.vo.ProductFilter;

public interface ProductService {
	
	public Contents getContent(int no);
	public Map<String,Object> getGiftItem(int no);
	
	//21-03-03 16:40 양성룡 선물 1개의 정보 가져오기
	public Map<String, Object> giftOne(int no);
	
	//21-03-04 18:25 양성룡 선물 목록 가져오기
	public Map<String, Object> giftList(int page, String filter);
	public Map<String, Object> addProduct(Product product,Discount discount,DeliveryType deliveryType);
	Map<String, Object> getList(ProductFilter pf);
}
