package com.jyp.tw.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jyp.tw.dao.ContentsDAO;
import com.jyp.tw.dao.DeliveryTypeDAO;
import com.jyp.tw.dao.DiscountDAO;
import com.jyp.tw.dao.ProdOptionDAO;
import com.jyp.tw.dao.ProductDAO;
import com.jyp.tw.dao.ProductImgDAO;
import com.jyp.tw.dao.ReviewDAO;
import com.jyp.tw.dao.ReviewImageDAO;
import com.jyp.tw.util.PaginateUtil;
import com.jyp.tw.vo.Contents;
import com.jyp.tw.vo.DeliveryType;
import com.jyp.tw.vo.Discount;
import com.jyp.tw.vo.PageVO;
import com.jyp.tw.vo.Product;
import com.jyp.tw.vo.ProductFilter;
import com.jyp.tw.vo.Review;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ContentsDAO contentsDAO;
	@Autowired
	private ProductDAO productDAO; 
	@Autowired
	private ReviewDAO reviewDAO;
	@Autowired
	private ReviewImageDAO reviewImageDAO;
	//할인
	@Autowired
	private DiscountDAO discountDAO;
	//상품이미지
	@Autowired
	private ProductImgDAO productImgDAO;
	//배송옵션
	@Autowired
	private DeliveryTypeDAO deliveryTypeDAO;
	//상품옵션
	@Autowired
	private ProdOptionDAO prodOptionDAO;
		
	
	@Override
	public Contents getContent(int no) {
		return contentsDAO.selectContent(no);
	}
	
	@Override
	public Map<String, Object> getGiftItem(int no) {
		List<Product> products = productDAO.selectGiftItem(no);
		int giftNo = 0;
		int idx =0;
		
		Map<String,Object> reviews = new ConcurrentHashMap<String, Object>();
		for(Product product:products) {
			giftNo=product.getNo();
			reviews.put(""+idx,reviewDAO.selectReviewScore(giftNo));
			idx++;
		}
		Map<String,Object> map = new ConcurrentHashMap<String, Object>();
		map.put("products", products);
		map.put("reviews", reviews);
		
		return map;
	}
	
	//21-03-03 16:43 양성룡 양성룡 선물 1개의 정보 가져오기
		@Override
		public Map<String, Object> giftOne(int no) {
			//맵 선언
			Map<String, Object> map = new ConcurrentHashMap<String, Object>();
			//상품 정보
			map.put("product", productDAO.selectOne(no));
			//할인 정보, 할인 안할 수도 있어서 try catch
			try {
				map.put("discount",discountDAO.selectOne(no));
			} catch (Exception e) {
			}
			//배송 옵션
			if(deliveryTypeDAO.selectOne(no)!=null) map.put("delivery", deliveryTypeDAO.selectOne(no));
			//상품 서브 이미지
			map.put("subs",productImgDAO.selectListBySub(no));
			//상품 설명 이미지
			map.put("details",productImgDAO.selectListByDetail(no));
			//상품 옵션
			map.put("options",prodOptionDAO.selectListByProductNo(no));
			//21-03-04 15:25 양성룡 한 상품의 모든 리뷰 불러오기, 없을 수도 있어서 try catch
			try {
				//21-03-26 21:01 옵션이 없는 경우
				if(map.get("options").toString().equals("[]")) {
					map.put("reviews",reviewDAO.selectListByProductNoNoOption(no));
				//21-03-26 21:02 옵션이 있는 경우
				}else {
					map.put("reviews",reviewDAO.selectListByProductNo(no));
				}
				//21-03-26 21:01 리뷰에 있는 이미지
				for(Review review:(List<Review>)map.get("reviews")) {
					review.setReviewImages(reviewImageDAO.getReviewImage(review.getNo()));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return map;
		}
		
		//21-03-04 18:25 양성룡 선물 목록 가져오기
		@Override
		public Map<String, Object> giftList(int page, String filter) {
			
			Map<String,Object> modelMap=new ConcurrentHashMap<String, Object>();
			
			int numPage = 12;		
			
			PageVO pageVO=new PageVO(page,numPage);
			
			pageVO.setFilter(filter);

			int total=productDAO.selectTotal();
			
			String paginate=PaginateUtil.getPaginate(page, total, numPage, 5, "");
			
			modelMap.put("paginate", paginate);
			modelMap.put("giftList", productDAO.selectList(pageVO));
			
			return modelMap;
	}
		@Override
		public Map<String, Object> addProduct(Product product, Discount discount, DeliveryType deliveryType) {
			
			Map<String, Object> map = new ConcurrentHashMap<String, Object>();
			
			map.put("product", productDAO.insert(product));
			deliveryType.setNo(product.getNo());
			map.put("deliveryType", deliveryTypeDAO.insert(deliveryType));
			
			System.out.println(discount.getNo());
			
			if(discount.getStartDate()!=null) {
				discount.setNo(product.getNo());
				map.put("discount", discountDAO.insert(discount));
			}
			
			return map;
		}
		@Override
		public Map<String, Object> getList(ProductFilter pf) {
//			Map<String, Object> map = new ConcurrentHashMap<String, Object>();
			Map<String, Object> model = new ConcurrentHashMap<String, Object>();
			model.put("products",productDAO.selectListPicker(pf));
			return model;
		}

}
