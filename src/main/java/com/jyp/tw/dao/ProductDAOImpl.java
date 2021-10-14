package com.jyp.tw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jyp.tw.vo.PageVO;
import com.jyp.tw.vo.Product;
import com.jyp.tw.vo.ProductFilter;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<Product> selectGiftItem(int no) {
		return session.selectList("product.selectGiftItem",no);
	}
	@Override
	public List<Product> selectselectCartList(int no) {
		return session.selectList("product.selectCartList", no);
	}
	@Override
	public Product selectOneCartList(Product product) {
		return session.selectOne("product.selectOneCartList", product);
	}
	@Override
	public Product selectOne(int no) {
		return session.selectOne("product.selectOne",no);
	}
	
	//21-03-04 18:24 양성룡 상품 리스트 가져오기
	@Override
	public List<Product> selectList(PageVO pageVO) {
		return session.selectList("product.selectList",pageVO);
	}
	
	//21-03-04 18:55 양성룡 상품 총 갯수
	@Override
	public int selectTotal() {
		return session.selectOne("product.selectTotal");
	}
	@Override
	public int insert(Product product) {
		return session.insert("product.insert", product);
	}
	@Override
	public List<Product> selectListPicker(ProductFilter pf) {
		// TODO Auto-generated method stub
		return session.selectList("product.selectListPicker",pf);
	}
}
