package com.jyp.tw.controller;

import java.io.File;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jyp.tw.service.AdminService;
import com.jyp.tw.service.CategoryService;
import com.jyp.tw.util.FileRenameUtil;
import com.jyp.tw.util.ResizeImageUtil;
import com.jyp.tw.vo.Category;
import com.jyp.tw.vo.OrderProd;

@Controller
public class AdminController {
	@Autowired
	private AdminService service;
	@Autowired
	private CategoryService categoryService;
	
	//나혁진 작성
	@RequestMapping(value="/admin/user/page/{page}",method = RequestMethod.GET)
	public String userManagement(Model model, @PathVariable int page) {
		
		model.addAllAttributes(service.getMemberList(page));
		
		return "adminUserManagementPage";
	}
	//나혁진 작성
	@RequestMapping(value="/ajax/ban/{no}",method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userBan(@PathVariable int no) {
		
		return "{\"result\":"+service.userBan(no)+"}";
	}
	//나혁진 작성
	@RequestMapping(value="/ajax/noBan/{no}",method = RequestMethod.DELETE,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String cancelBan(@PathVariable int no) {
		
		return "{\"result\":"+service.cancelBan(no)+"}";
	}
	
	//김정석 관리자 주문배송 관리 페이지 띄우기
		@RequestMapping(value="/admin/delivery/row/{rownum}/page/{page}", method = RequestMethod.GET)
		private String orderDeliveryPage(Model model, @PathVariable int page, @PathVariable int rownum) {
			
			model.addAllAttributes(service.getOrderProds(page,rownum));
			
			return "orderDelivery";
		}
		
		//운송장번호 입력하기
		@RequestMapping(value="/ajax/admin/delivery",
				method = RequestMethod.PUT, produces = "application/json; charset=UTF-8")
		@ResponseBody
		private String updateOrderProd(OrderProd orderProd) {
			System.out.println(orderProd.getDelState());
			System.out.println(orderProd.getWaybill());
			return service.updateDelState(orderProd);
		}
		@GetMapping("/admin/category")
		private String adminMain() {
			
			return "categoryRegister";
		}
		
		@RequestMapping(value = "/ajax/uploadImage", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		private String addCI(String type, MultipartFile image, HttpServletRequest request) throws Exception{
			
			// 서버
			ServletContext application = request.getServletContext();
			// 기본경로
			String rootPath = application.getRealPath("/");
			// 업로드 폴더 경로
			String uploadPath = rootPath + "img" + File.separator+"upload"+ File.separator;
			// 파일의 실제 이름
			String fileName = image.getOriginalFilename();
			// 파일 객체 생성
			File file = new File(uploadPath + fileName);
			// 파일 이름이 같다면 파일 이름에 숫자가 붙는다.
			file = FileRenameUtil.rename(file);

			// 임시 폴더에서 우리 업로드 폴더로 이동
			image.transferTo(file);
			// 리사이즈가 필요한 경우 하면된다.
			String resizePath = rootPath + "img" + File.separator;
			ResizeImageUtil.resize(file.toString(), resizePath + file.getName(), 200);
			
			return "{\"image\":\""+file.getName()+"\"}";
		}
		
		@PostMapping("/admin/category")
		private String addCategory(Category category) {
			System.out.println("여기");
			System.out.println(category.getName());
			
			categoryService.addCategory(category);
			
			return "adminMain";
		}
	
	
	
}
