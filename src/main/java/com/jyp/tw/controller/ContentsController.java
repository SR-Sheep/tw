package com.jyp.tw.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jyp.tw.service.ContentsService;

@Controller
public class ContentsController {

	@Autowired
	private ContentsService service;
	
	@RequestMapping(value = "/admin/contents", method = RequestMethod.GET)
	public String ContentsAdmin(Model model) {
		
		model.addAttribute("contents",service.getContentsList());
		
		return "contentsAdmin";
	}
	
	@RequestMapping(value = "/admin/contents/register", method = RequestMethod.GET)
	public String ContentsRegister() {
		
		return "contentsRegister";
	}
	
	@RequestMapping(value = "/admin/contents/{no}/modify", method = RequestMethod.GET)
	public String ContentsModify(Model model ,@PathVariable int no) {
		
		return "contentsRegister";
	}
	
}
