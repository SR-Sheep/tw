package com.jyp.tw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jyp.tw.vo.ReviewImage;

@Repository
public class ReviewImageDAOImpl implements ReviewImageDAO {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<ReviewImage> getReviewImage(int reviewNo) {
		// TODO Auto-generated method stub
		return session.selectList("reviewImage.selectReviewDetailImg", reviewNo);
	}
	
}
