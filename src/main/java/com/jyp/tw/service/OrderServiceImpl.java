package com.jyp.tw.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jyp.tw.dao.CartlistDAO;
import com.jyp.tw.dao.DeliveryDAO;
import com.jyp.tw.dao.DeliveryInfoDAO;
import com.jyp.tw.dao.OrderProdDAO;
import com.jyp.tw.dao.PaymentDAO;
import com.jyp.tw.dao.PointHisDAO;
import com.jyp.tw.dao.ProdOptionDAO;
import com.jyp.tw.dao.ProductDAO;
import com.jyp.tw.util.PaginateUtil;
import com.jyp.tw.vo.Cartlist;
import com.jyp.tw.vo.Delivery;
import com.jyp.tw.vo.DeliveryInfo;
import com.jyp.tw.vo.OrderProd;
import com.jyp.tw.vo.PageVO;
import com.jyp.tw.vo.Payment;
import com.jyp.tw.vo.PointHis;
import com.jyp.tw.vo.Product;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private DeliveryDAO deliveryDAO;
	@Autowired
	private DeliveryInfoDAO deliveryInfoDAO;
	@Autowired
	private PointHisDAO pointHisDAO;
	@Autowired
	private PaymentDAO paymentDAO;
	@Autowired
	private OrderProdDAO orderProdDAO;
	@Autowired
	private CartlistDAO cartlistDAO;
	@Autowired
	private ProdOptionDAO prodOptionDAO;
	
	@Override
	public List<Product> getCartList(int no) {
		return productDAO.selectselectCartList(no);
	}
	
	//21-03-27 19:48 양성룡 장바구니 추가 클릭 시
	@Override
	public int addCart(Cartlist cartlist) {
		//상품 옵션이 없는 경우
		if(cartlist.getOptionNo()<0) {
			//장바구니에 해당 상품이 존재하지 않으면 insert
			if(cartlistDAO.selectOneNoOption(cartlist)==null) {
				return cartlistDAO.insertNoOption(cartlist);
			}
			//장바구니에 해당 상품이 존재하면 -1
			return -1;
		}else {
			//장바구니에 해당 상품이 존재하지 않으면 insert
			if(cartlistDAO.selectOne(cartlist)==null) {
				return cartlistDAO.insert(cartlist);
			}
			//장바구니에 해당 상품이 존재하면 -1
			return -1;
		}
		
	}
	
	
	@Override
	public Map<String, Object> getDelivery(Product product) {
		Map<String,Object> map = new ConcurrentHashMap<String, Object>();
		
		
		map.put("cartList", productDAO.selectOneCartList(product));
		map.put("lists", deliveryDAO.selectdeliveryName(product.getNo()));
		map.put("basicList", deliveryDAO.selectBasicDet(product.getNo()));
		//map.put("deliveryConfirm", deliveryInfoDAO.selectCount(product.getCartListNo()));
		
		return map;
	}
	
	@Override
	public Map<String,Object> getDelivery(int no,String name) {
		Delivery delivery = new Delivery();
		delivery.setMemberNo(no);
		delivery.setName(name);
		Map<String,Object> map = new ConcurrentHashMap<String, Object>();
		map.put("list", deliveryDAO.selectDeliveryFillter(delivery));
		return map;	
	}
	@Override
	public int registerDeliveryInfo(DeliveryInfo deliveryInfo) {
		return deliveryInfoDAO.insert(deliveryInfo);
	}
	
	@Override
	public String order(String[] cartNo, String[] optionNo,int sumPrice,int no,String[] count,String[] prodNum) {
		//포인트히스토리
		PointHis pointHis = new PointHis();
		pointHis.setMemberNo(no);
		pointHis.setPoint(sumPrice*-1);
		pointHisDAO.insertOrderPoint(pointHis);
		
		//주문
		Payment payment = new Payment();
		payment.setPointNo(pointHis.getNo());
		payment.setMemberNo(no);
		paymentDAO.insertPay(payment);
		//주문상품
		for(int i=0; i<cartNo.length;i++) {
			DeliveryInfo deliveryInfo =	deliveryInfoDAO.selectDelivery(Integer.parseInt(cartNo[i]));
			OrderProd orderProd = new OrderProd();
			orderProd.setReceiver(deliveryInfo.getReceiver());
			orderProd.setReceiveDate(deliveryInfo.getReceiveDate());
			orderProd.setAddress(deliveryInfo.getAddress());
			orderProd.setAddressDetail(deliveryInfo.getAddressDetail());
			orderProd.setCount(Integer.parseInt(count[i]));
			orderProd.setRequest(deliveryInfo.getRequest());
			orderProd.setProductNo(Integer.parseInt(prodNum[i]));
			orderProd.setOptionNo(Integer.parseInt(optionNo[i]));
			orderProd.setPaymentNo(payment.getNo());
			orderProdDAO.insertOrder(orderProd);
			deliveryInfoDAO.delete(Integer.parseInt(cartNo[i]));
			cartlistDAO.delete(Integer.parseInt(cartNo[i]));
		
			
		}
		
		
		return "{\"result\":true}";
	}
	@Override
	public List<Payment> getOrders(int memberNo) {
		return paymentDAO.selectPaymentList(memberNo);
	}
	
	@Override
	public Map<String, Object> getOrderPage(int page, int memberNo) {

		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		PageVO pageVo = new PageVO(page, 5, memberNo);
		
		int total = paymentDAO.selectTotal(memberNo);
		
		String paginate = PaginateUtil.getPaginate(page, total, 5, 3, "/member/{memberNo}/myShopping");
		
		List<Payment> payments = paymentDAO.selectList(pageVo);
		
		for (Payment payment : payments) {
			payment.setOrderProds(orderProdDAO.selectOrderProd(payment.getNo()));
		}//for end
		
		map.put("payment", payments);
		map.put("paginate", paginate);
		
		return map;
	}
	
}
