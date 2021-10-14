package com.jyp.tw.dao;

import java.util.List;

import com.jyp.tw.vo.PageVO;
import com.jyp.tw.vo.Review;

public interface ReviewDAO {
	public Review selectReviewScore(int no);
		//21-03-04 14:18 양성룡 한 상품의 리뷰 내용 가져오기
		public List<Review> selectListByProductNo(int productNo);
		//21-03-24 18:21 양성룡 
		public List<Review> selectListByProductNoNoOption(int productNo);
		
		
		//0303 오세훈(리뷰 리스트 페이징처리)
		public List<Review> getReviewList(PageVO pageVO);
		//0303 오세훈 (관리자 리뷰 상세보기)
		public Review getReviewDetail(int reviewNo);
}
