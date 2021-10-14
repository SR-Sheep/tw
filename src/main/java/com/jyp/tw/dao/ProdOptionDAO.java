package com.jyp.tw.dao;

import java.util.List;

import com.jyp.tw.vo.ProdOption;

public interface ProdOptionDAO {

	//21-03-03 16:37 양성룡 상품1개의 모든 옵션 가져오기
		public List<ProdOption> selectListByProductNo(int productNo);
}
