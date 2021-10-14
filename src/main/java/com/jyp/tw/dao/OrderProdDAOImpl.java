package com.jyp.tw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jyp.tw.vo.OrderProd;
import com.jyp.tw.vo.PageVO;

@Repository
public class OrderProdDAOImpl implements OrderProdDAO {

	@Autowired
	private SqlSession session;
	
	@Override
	public int insertOrder(OrderProd orderProd) {
		return session.insert("orderProd.InsertOrder",orderProd);
	}
	@Override
	public List<OrderProd> selectList(PageVO pageVO) {
		return session.selectList("orderProd.selectOrderProdList",pageVO);
	}
	@Override
	public int selectTotal(PageVO pageVO) {
		return session.selectOne("orderProd.selectTotal",pageVO);
	}
	@Override
	public int updateDelState(OrderProd orderProd) {
		return session.update("orderProd.updateDeliveryState",orderProd);
	}
	@Override
	public List<OrderProd> selectOrderProd(int memberNo) {
		return session.selectList("orderProd.selectOrderProd", memberNo);
	}
}
