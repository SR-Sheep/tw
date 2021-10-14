package com.jyp.tw.dao;

import java.util.List;

import com.jyp.tw.vo.ProductImg;

public interface ProductImgDAO {

	//21-03-03 17:56 양성룡 상품1개의 서브 이미지 가져오기
		public List<ProductImg> selectListBySub(int productNo);
		//21-03-03 17:56 양성룡 상품1개의 설명 이미지 가져오기
		public List<ProductImg> selectListByDetail(int productNo);

}
