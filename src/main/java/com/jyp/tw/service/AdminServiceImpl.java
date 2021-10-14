package com.jyp.tw.service;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jyp.tw.dao.MemberDAO;
import com.jyp.tw.dao.OrderProdDAO;
import com.jyp.tw.util.PaginateUtil;
import com.jyp.tw.vo.OrderProd;
import com.jyp.tw.vo.PageVO;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private OrderProdDAO orderProdDAO;
	
	@Override
	public Map<String, Object> getMemberList(int page) {
		Map<String, Object> map=new ConcurrentHashMap<String, Object>();
		
		int total = memberDAO.selectMemberTotal();
		
		PageVO pageVO = new PageVO(page,10);
		
		map.put("members", memberDAO.selectMemberList(pageVO));
		map.put("paginate",PaginateUtil.getPaginate(page, total, 5, 3, "/admin/user"));
		map.put("memberCount", total);
		
		return map;
	}
	@Override
	public int userBan(int no) {
		
		memberDAO.updateMemberBan(no);
		
		return memberDAO.selectBanCount(no);
	}
	@Override
	public boolean cancelBan(int no) {
		int result = memberDAO.updatecancelBan(no);
		
		if(result == 1 ) {
			return true;
		}
		
		return false;
	}
	@Override
	public Map<String, Object> getOrderProds(int page, int rownum) {
		
		Map<String,Object> modelMap=new ConcurrentHashMap<String, Object>();
		
		PageVO pageVO=new PageVO(page,rownum);
		
		int total = orderProdDAO.selectTotal(pageVO);
		
		String paginate = PaginateUtil.getPaginate(page, total, rownum, 3, "/admin/delivery/row/"+rownum);
		
		modelMap.put("orderProdList", orderProdDAO.selectList(pageVO));
		modelMap.put("listTotalCount", total);
		modelMap.put("paginate", paginate);
		
		return modelMap;
	}
	
	@Override
	public String updateDelState(OrderProd orderProd) {
			int result = orderProdDAO.updateDelState(orderProd);
		return "{\"result\":"+result+"}";
	}
	
	
}
