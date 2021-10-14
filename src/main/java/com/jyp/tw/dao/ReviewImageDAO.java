package com.jyp.tw.dao;

import java.util.List;

import com.jyp.tw.vo.ReviewImage;

public interface ReviewImageDAO {
	
	//0304 오세훈(관리자 리뷰상세 이미지)
		public List<ReviewImage> getReviewImage(int reviewNo); 
}
