package com.jyp.tw.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jyp.tw.service.OrderService;
import com.jyp.tw.vo.Cartlist;
import com.jyp.tw.vo.Delivery;
import com.jyp.tw.vo.DeliveryInfo;
import com.jyp.tw.vo.Product;

@Controller
public class OrderController {
	@Autowired
	private OrderService service;
	
	//21-03-27 20:01 양성룡 장바구니 추가 클릭 시
	@RequestMapping(value ="/ajax/addCart",method = RequestMethod.POST)
	@ResponseBody
	public boolean addCdart(int memberNo, int productNo, int optionNo, int count) {
		Cartlist cartlist = new Cartlist(memberNo, productNo, optionNo, count);
		//이미 장바구니에 있으면 false, 없어서 신규 추가시 true
		return service.addCart(cartlist)>0?true:false;
	}
	
	//나혁진 작성
	@RequestMapping(value="/member/{memberNo}/cartList",method = RequestMethod.GET)
	public String cartList(Model model,@PathVariable int memberNo) {
		model.addAttribute("cartLists",service.getCartList(memberNo));
		return "cartList";
	}
	//나혁진 작성
	@RequestMapping(value="/ajax/deliveryList",method = RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> getDelivery(int no, int cartListNo) {
		Product product = new Product();
		product.setCartListNo(cartListNo);
		product.setNo(no);
		return service.getDelivery(product);
	}
	//나혁진 작성
	@RequestMapping(value="/ajax/deliveryList/filter",method = RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> getDeliveryFilter(int no,String name) {
		return service.getDelivery(no,name);
	}
	//나혁진 작성
	@RequestMapping(value="/deliveryInfo",method = RequestMethod.POST)
	public String registerDeliveryInfo(DeliveryInfo deliveryInfo,int loginMemberNo) {
		service.registerDeliveryInfo(deliveryInfo);
		return "redirect:/member/"+loginMemberNo+"/cartList";
	}
	//나혁진 작성
	@RequestMapping(value="/ajax/order",method = RequestMethod.POST)
	@ResponseBody
	public String order(String[] cartNo,String[] optionNo,int sumPrice,int no,String[] count,String[] prodNum){
		return service.order(cartNo,optionNo,sumPrice,no,count,prodNum);
		
	}
	//마이쇼핑 페이지(ajax를 위한 jsp페이지)
			@RequestMapping(value="/member/{memberNo}/myShopping", method = RequestMethod.GET)
			public String myShopping(Model model,
					@PathVariable int memberNo) {
				
				model.addAttribute("payments", service.getOrders(memberNo));
				
				return "myShopping";
				
			}
		//마이쇼핑 ajax로 페이징처리 
			@RequestMapping(value="/ajax/myShopping/{memberNo}/{page}", method = RequestMethod.GET)
			@ResponseBody
			public Map<String, Object> myShoppingAjax(Model model,@PathVariable int memberNo, @PathVariable int page) {
						
			return service.getOrderPage(page, memberNo);
			}
	
	
}
