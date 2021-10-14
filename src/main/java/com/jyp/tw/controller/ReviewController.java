package com.jyp.tw.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jyp.tw.service.ReviewService;
import com.jyp.tw.vo.Review;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService service;
	
	//0303 오세훈
	@RequestMapping(value="/admin/review", method = RequestMethod.GET)
	private String adminMain() {
		return "adminMain";
	}
	//0303 오세훈
	@RequestMapping(value="/ajax/admin/review", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	@ResponseBody
	private List<Review> reviewList(int page, int numPage, int period, String name) {
		//System.out.println(period);
		//System.out.println(name);
		System.out.println(page);
		System.out.println(numPage);
		return service.getReviewList(page, numPage);
	}
	//0303 오세훈
	@RequestMapping(value="/admin/reply", method = RequestMethod.POST)
	private String writeReply(int[] reviewNo, String replyContent, int adminMember) {
		service.writeReply(reviewNo,replyContent,adminMember);
		return "redirect:/admin/review";
	}
	//0303 오세훈
	@RequestMapping(value="/ajax/admin/review/{reviewNo}", method = RequestMethod.GET)
	@ResponseBody
	private Map<String, Object> getReviewDetail(@PathVariable int reviewNo) {
		return service.getReviewDetail(reviewNo);
	}
	@RequestMapping(value="/myPage/myReview/wroteReview")
	public String myReview() {
		
		return "myReview";
	}
}
