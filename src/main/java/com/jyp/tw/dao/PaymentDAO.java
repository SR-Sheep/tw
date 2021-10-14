package com.jyp.tw.dao;

import java.util.List;

import com.jyp.tw.vo.PageVO;
import com.jyp.tw.vo.Payment;

public interface PaymentDAO {
	public int insertPay(Payment payment);
	//주문 내역 리스트 불러오기
		public List<Payment> selectPaymentList(int memberNo);
		
		//페이징 처리 되어 있는 그룹 목록 메서드
		public List<Payment> selectList(PageVO pageVO);
		
		//주문의 전체크기를 얻어오는 메서드
		public int selectTotal(int memberNo);
}
