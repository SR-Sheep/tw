package com.jyp.tw.controller;

import java.sql.Date;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jyp.tw.service.MemberService;
import com.jyp.tw.vo.Member;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	@Autowired
	private JavaMailSender mailSender;
	
	//나혁진 작성
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		return "main";
	}
	@RequestMapping(value="/log",method=RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	@RequestMapping(value="/log",method=RequestMethod.DELETE)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	@RequestMapping(value="/log",method=RequestMethod.POST)
	public String log(Member member,HttpSession session,RedirectAttributes ra) {
		/*
		 * RedirectAttributes의 FlashAttribute는 한 번만 사용하고 사라지는 attribute
		 * */
		Member loginMember = service.login(member);
		if(loginMember!=null) {
			session.setAttribute("loginMember", loginMember);
			return "redirect:/";
		}else {
			ra.addFlashAttribute("message", "아이디나 비밀번호가 틀렸습니다.");
			return "redirect:/log";
		}
	
	}
	//김정석 마이페이지 비밀번호 변경 페이지 띄우기
		@RequestMapping(value="/member/{no}", method = RequestMethod.GET)
		private String orderDeliveryPage(Model model, @PathVariable int no) {
			
			model.addAllAttributes(service.getMyInfo(no));
			return "myPageInfo";
		}
		//멤버 이메일 변경
		@RequestMapping(value="/member/{id}/email",method = RequestMethod.PUT ,produces = "application/json; charset=UTF-8")
		@ResponseBody
		public String changeEmail(String email, @PathVariable String id) {
			Member member=new Member();
			member.setEmail(email);
			member.setId(id);
			return "{\"result\":"+service.modifyEmail(member)+"}";
		}
		
		
		//회원가입 페이지
		@RequestMapping(value = "/join", method = RequestMethod.GET)
		public String join() {
			return "joinForm";
		}
		//회원가입 요청
		@RequestMapping(value = "/join", method = RequestMethod.POST)
		public String joinMember(Member member,String year, String month, String date) {
			Date birthDate=Date.valueOf(year+"-"+month+"-"+date);
			member.setBirthDate(birthDate);
			service.makeMember(member);
			return "redirect:/";
		}
		//비밀번호찾기 페이지
		@RequestMapping(value = "/authorize", method = RequestMethod.GET)
		public String findPassword() {
			System.out.println("GET /authorize");
			return "findPassword";
		}
		//비밀번호 변경 페이지
		@RequestMapping(value = "/password", method = RequestMethod.GET)
		public String PasswordForm() {
			System.out.println("GET /password");
			return "findId";
		}
		//비밀번호 변경 요청
		@RequestMapping(value = "/password", method = RequestMethod.PUT)
		public String changePassword(Member member) {
			System.out.println("PUT /password");
			service.modify(member);
			return "redirect:/";
		}
		//현재 비밀번호 확인 페이지
		@RequestMapping(value = "/check/password", method = RequestMethod.GET)
		public String curPassword(Member member) {
			System.out.println("GET /check/password");
			return "checkPassword";
		}
		
		
		//비밀번호 변경 위한 인증 요청 
		@RequestMapping(value = "/authorize", method = RequestMethod.POST)
		public String findPassword(Member member,HttpSession session, RedirectAttributes ra) {
			System.out.println("POST /authorize");
			Member loginMember = service.authorizeId(member);
			if(loginMember!=null) {
				session.setAttribute("loginMember", loginMember);
				ra.addFlashAttribute("auth","auth");
				return "redirect:/password";
			}else {
				ra.addFlashAttribute("msg","아이디와 이메일이 일치하지 않습니다. 다시확인하세요.");
				return "redirect:/authorize";
			}
		}
		
		//아이디 중복 확인
		@RequestMapping(value="/ajax/check/id",method= RequestMethod.GET)
		@ResponseBody
		public String checkId(String id) {
			
			return "{\"result\":"+service.checkId(id)+"}";
		}
		
		
		/* 이메일 인증 요청*/
		@RequestMapping(value = "/ajax/email", method = RequestMethod.GET)
		@ResponseBody
		public String mailCheckGET(String email) throws Exception {

			/* 뷰(View)로부터 넘어온 데이터 확인 */
//	        logger.info();
//	        logger.info();
			System.out.println("이메일 데이터 전송 확인");
			System.out.println("인증번호 : " + email);
			/* 인증번호(난수) 생성 */
			Random random = new Random();
			int checkNum = random.nextInt(888888) + 111111;
			System.out.println("인증번호 " + checkNum);
			// logger.info();

			String subject = "test 메일";
			String setFrom = "bkhyun0516@gmail.com";
			String toMail = email;
			String title = "회원가입 인증 이메일 입니다.";
			String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는 " + checkNum + "입니다." + "<br>"
					+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

			try {

				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
				helper.setFrom(setFrom);
				helper.setTo(toMail);
				helper.setSubject(title);
				helper.setText(content, true);
				mailSender.send(message);
			} catch (Exception e) {
				e.printStackTrace();
			}
			String number = Integer.toString(checkNum); 
			return "{\"number\":\""+number +"\"}";
		}
}
