package com.jyp.tw.dao;

import java.util.List;

import com.jyp.tw.vo.OrderProd;
import com.jyp.tw.vo.PageVO;

public interface OrderProdDAO {

	public int insertOrder(OrderProd orderProd);
		//주문배송 리스트를 가져온다
		public List<OrderProd> selectList(PageVO pageVO);
		
		//리스트 전체 갯수를 구한다
		public int selectTotal(PageVO pageVO);
		
		//배송상태 업데이트
		public int updateDelState(OrderProd orderProd);
		//주문상품을 얻어오는 메서드
		public List<OrderProd> selectOrderProd(int memberNo);
}
