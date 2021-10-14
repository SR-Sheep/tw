package com.jyp.tw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jyp.tw.vo.PageVO;
import com.jyp.tw.vo.Payment;

@Repository
public class PaymentDAOImpl implements PaymentDAO {

	@Autowired
	private SqlSession session;
	
	@Override
	public int insertPay(Payment payment) {
		return session.insert("payment.insertPay", payment);
	}
	@Override
	public List<Payment> selectPaymentList(int memberNo) {
		return session.selectList("payment.selectPaymentList", memberNo);
	}
	
	@Override
	public List<Payment> selectList(PageVO pageVO) {
		return session.selectList("payment.selectList", pageVO);
	}
	
	@Override
	public int selectTotal(int memberNo) {
		return session.selectOne("payment.selectTotal", memberNo);
	}
}
