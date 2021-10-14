package com.jyp.tw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jyp.tw.vo.PageVO;
import com.jyp.tw.vo.Review;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Autowired
	private SqlSession session;
	
	@Override
	public Review selectReviewScore(int no) {
		return session.selectOne("review.selectReviewScore", no);
	}
	
	@Override
	public List<Review> selectListByProductNo(int productNo) {
		return session.selectList("review.selectListByProductNo",productNo);
	}
	
	@Override
	public List<Review> selectListByProductNoNoOption(int productNo) {
		return session.selectList("review.selectListByProductNoNoOption",productNo);
	}
	
	
	//0303 오세훈
	@Override
	public List<Review> getReviewList(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("review.selectReviewList", pageVO);
	}
		
	//0303 오세훈
	@Override
	public Review getReviewDetail(int reviewNo) {
		// TODO Auto-generated method stub
		return session.selectOne("review.selectReviewByAdmin", reviewNo);
	}
	
}
