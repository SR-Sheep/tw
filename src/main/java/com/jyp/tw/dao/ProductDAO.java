package com.jyp.tw.dao;

import java.util.List;

import com.jyp.tw.vo.PageVO;
import com.jyp.tw.vo.Product;
import com.jyp.tw.vo.ProductFilter;

public interface ProductDAO {
	public List<Product> selectGiftItem(int no);
	public List<Product> selectselectCartList(int no);
	public Product selectOneCartList(Product product);
	//21-03-03 16:26 양성룡 선물 정보 가져오기
		public Product selectOne(int no);
		
		//21-03-04 18:23 양성룡 선물 정보 가져오기
		public List<Product> selectList(PageVO pageVO);
		
		//21-03-04 18:54 양성룡 선물 총 갯수 가져오기
		public int selectTotal();
		public int insert(Product product);
		public List<Product> selectListPicker(ProductFilter pf);
	
}
