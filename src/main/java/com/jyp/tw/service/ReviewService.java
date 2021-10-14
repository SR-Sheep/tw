package com.jyp.tw.service;

import java.util.List;
import java.util.Map;

import com.jyp.tw.vo.Review;

public interface ReviewService {
	
	
	//0303 오세훈 (리뷰목록 가져오기 보여질 게시물 개수 변수처리)
		public List<Review> getReviewList(int page, int numPage);
		//0303 오세훈 (관리자 일괄 답글 작성)
		public int writeReply(int[] reviewNo, String replyContent, int adminMember);
		//030 오세훈 (관리자 리뷰 상세 보기)
		public Map<String, Object> getReviewDetail(int reviewNo);
	

}
