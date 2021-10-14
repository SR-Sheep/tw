package com.jyp.tw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jyp.tw.vo.ProductImg;

@Repository
public class ProductImgDAOImpl implements ProductImgDAO {

	@Autowired
	private SqlSession session;
	
	//21-03-03 17:56 양성룡 상품1개의 설명 이미지 가져오기
		@Override
		public List<ProductImg> selectListByDetail(int productNo) {
			return session.selectList("productImg.selectListByDetail", productNo);
		}

		// 21-03-03 17:56 양성룡 상품1개의 서브 이미지 가져오기
		@Override
		public List<ProductImg> selectListBySub(int productNo) {
			return session.selectList("productImg.selectListBySub", productNo);
		}
}
