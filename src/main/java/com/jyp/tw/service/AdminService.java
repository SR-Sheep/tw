package com.jyp.tw.service;

import java.util.Map;

import com.jyp.tw.vo.OrderProd;

public interface AdminService {
	
	public Map<String, Object> getMemberList(int page);

	public int userBan(int no);
	public boolean cancelBan(int no);
	public Map<String, Object> getOrderProds(int page,int rownum);

	public String updateDelState(OrderProd orderProd);
}
