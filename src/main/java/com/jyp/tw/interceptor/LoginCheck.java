package com.jyp.tw.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginCheck implements HandlerInterceptor{
	
	//컨트롤러의 메서드 작동후(후처리)
//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//		System.out.println("LoginCheck postHandle");
//		
//	}
	
	
	//컨트롤러의 메서드 가기전(전처리)
	//리턴값이 true면 컨트롤러 메서드로 이동 false면 컨트롤러 메서드로 이동하지않음
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		/*Member loginMember = (Member)session.getAttribute("loginMember");
		
		if(loginMember == null) {
			response.sendRedirect("/");
			return false;
		}else {
			return true;
		}//if~else end*/
		return false;
		
	}
	
	
	
}
