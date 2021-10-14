package com.jyp.tw.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jyp.tw.service.DeliveryService;
import com.jyp.tw.vo.Delivery;

@Controller
public class DeliveryController {
	
	@Autowired
	private DeliveryService service;

	
	//배송지관리를 불러옴
	@RequestMapping(value = "/member/{memberNo}/address", method = RequestMethod.GET)
	public String addressInfo(Model model, @PathVariable int memberNo, Delivery delivery) {
		
		model.addAttribute("addressList",service.getAddressInfo(memberNo));

		return "destinationAdmin";
	}
	
	//배송지 등록
	@RequestMapping(value = "/member/{memberNo}/address", method = RequestMethod.POST)
	public String addressRegister(Delivery delivery, @PathVariable int memberNo) {
		System.out.println(delivery.getBaseDet());
		
		service.registerAddress(delivery);
		
		return "redirect:/member/"+delivery.getMemberNo()+"/address";
	}
	
	//배송지 삭제
	@RequestMapping(value = "/member/{memberNo}/address", method = RequestMethod.DELETE)
	public String addressDelete(@PathVariable int memberNo, int no) {
		System.out.println(no);
		
		service.deleteAddress(no);
		
		return "redirect:/member/"+memberNo+"/address";
	}
	
	//배송지 수정
	@RequestMapping(value = "/member/{memberNo}/address", method = RequestMethod.PUT)
	public String addressModify(@PathVariable int memberNo, Delivery delivery) {
		
		service.updateAddress(delivery);
		
		return "redirect:/member/"+memberNo+"/address";
	}
	
	//21.03.04 13:59 김기현 등록
	@RequestMapping(value = "/ajax/address/modify", method = RequestMethod.GET)
	@ResponseBody
	public void addressModifyForm(Model model, Delivery delivery) {
		
		model.addAttribute("address", service.selectOneAddress(delivery));
		
	}
	
}
