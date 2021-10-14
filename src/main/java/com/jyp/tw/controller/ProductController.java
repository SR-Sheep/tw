package com.jyp.tw.controller;

import java.io.File;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jyp.tw.service.CategoryService;
import com.jyp.tw.service.ProductService;
import com.jyp.tw.util.FileRenameUtil;
import com.jyp.tw.util.ResizeImageUtil;
import com.jyp.tw.vo.DeliveryType;
import com.jyp.tw.vo.Discount;
import com.jyp.tw.vo.Product;
import com.jyp.tw.vo.ProductFilter;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService service; 
	@Autowired
	private CategoryService cateoryService;
	//나혁진 작성
	@RequestMapping(value="/content/{no}",method = RequestMethod.GET)
	private String contentsDetail(Model model,@PathVariable int no) {
		model.addAttribute("content", service.getContent(no));
		return "contentsDetail";
	}
	//나혁진 작성
	@RequestMapping(value="/ajax/giftItem",method = RequestMethod.GET,produces = "application/json;charset=UTF-8")
	@ResponseBody
	private Map<String,Object> contentsProduct(int no) {
		return service.getGiftItem(no);
	}
	
		//21-03-03 17:05 양성룡 한 상품정보 가져오기
		@RequestMapping(value ="/gift/{giftNo}",method = RequestMethod.GET)
		private String productDetail(Model model, @PathVariable int giftNo) {
			model.addAllAttributes(service.giftOne(giftNo));		
			return "productDetail";
			
		}
		
		//21-03-04 16:21 양성룡 상품 리스트 페이지 이동
		@RequestMapping(value="/search",method = RequestMethod.GET)
		private String searchList() {
			return "searchList";
		}
		
		//21-03-04 18:44 양성룡 상품 목록 불러오기	
		@RequestMapping(value = "/ajax/searchList",method = RequestMethod.GET)
		@ResponseBody
		private Map<String,Object> giftListLoad(int page,String filter) {
			return service.giftList(page,filter);
		}
		
		@GetMapping("/admin/product")
		private String getcategory(Model model) {
			
			model.addAttribute("categories",cateoryService.getCategory());
			
			return "productRegister";
		}
		
		@RequestMapping(value = "/ajax/category", produces = "application/json;charset=UTF-8")
		@ResponseBody
		private String selectCategory() {
			
			cateoryService.getCategory();
			
			return "{\"name\":\""+cateoryService.getCategory()+"\"}";
		}
		
		@RequestMapping(value = "/ajax/reImg", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		private String addRepresentImg(String type, MultipartFile representImg, HttpServletRequest request) throws Exception{
			
			// 서버
			ServletContext application = request.getServletContext();
			// 기본경로
			String rootPath = application.getRealPath("/");
			// 업로드 폴더 경로
			String uploadPath = rootPath + "img" + File.separator+"upload"+ File.separator;
			// 파일의 실제 이름
			String fileName = representImg.getOriginalFilename();
			
			// 파일 객체 생성
			File file = new File(uploadPath + fileName);
			// 파일 이름이 같다면 파일 이름에 숫자가 붙는다.
			file = FileRenameUtil.rename(file);

			// 임시 폴더에서 우리 업로드 폴더로 이동
			representImg.transferTo(file);
			// 리사이즈가 필요한 경우 하면된다.
			String resizePath = rootPath + "img" + File.separator;
			ResizeImageUtil.resize(file.toString(), resizePath + file.getName(), 200);
			
			return "{\"name\":\""+file.getName()+"\"}";
		}
		
		
		@PostMapping("/admin/product")
		private String addProduct(Product product,Discount discount, DeliveryType deliveryType) {

			System.out.println(discount.getNo());
			System.out.println(discount.getDiscountRate());
			System.out.println(discount.getStartDate());
			System.out.println(discount.getEndDate());
			
			service.addProduct(product,discount,deliveryType);
			
			return "adminMain";
		}
		
		@RequestMapping(value="/admin/giftList",method=RequestMethod.GET)
		public String itemList() {
			return "itemList";
		}
		
		
		@RequestMapping(value="/admin/gift",method=RequestMethod.GET)
		@ResponseBody
		public Map<String,Object> searchGiftList(ProductFilter pf) {
			System.out.println("GET /admin/gift");
			return service.getList(pf);
		}
	
}
