package com.jyp.tw.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jyp.tw.dao.ReplyDAO;
import com.jyp.tw.dao.ReviewDAO;
import com.jyp.tw.dao.ReviewImageDAO;
import com.jyp.tw.util.PaginateUtil;
import com.jyp.tw.vo.PageVO;
import com.jyp.tw.vo.Reply;
import com.jyp.tw.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewDAO reviewDAO;
	@Autowired
	private ReplyDAO replyDAO;
	@Autowired
	private ReviewImageDAO reviewImageDAO;
	
	//0303 오세훈
	@Override
	public List<Review> getReviewList(int page, int numPage) {
		
		PageVO pageVO = new PageVO(page, numPage);
		
		int total = 33;
		
		String paginate = PaginateUtil.getPaginate(page, total, numPage, 3, "/admin/review");
		
		//System.out.println(reviewDAO.getReviewList(pageVO));
		
		return reviewDAO.getReviewList(pageVO);
	}
	//0303 오세훈
	@Override
	public int writeReply(int[] reviewNo, String contents, int adminNo) {
		for(int i = 0; i <reviewNo.length;i++) {
			System.out.println(reviewNo[i]);
			replyDAO.insertReply(new Reply(reviewNo[i],contents,adminNo));
		}
		return 0;
	}
	//0303 오세훈
	@Override
	public Map<String, Object> getReviewDetail(int reviewNo) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		map.put("reviewDetail", reviewDAO.getReviewDetail(reviewNo));
		map.put("reviewImage", reviewImageDAO.getReviewImage(reviewNo));
		
		return map;
	}
	
}
