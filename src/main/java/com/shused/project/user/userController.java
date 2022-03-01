package com.shused.project.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	
	// 회원가입 view로 이동
	@GetMapping("/user/signup_view")
	public String signupView() {
		return "/user/signUp";
	}
	
	// 로그인 view로 이동
	@GetMapping("/user/signin_view")
	public String signinView() {
		return "/user/signIn";
	}
	
	//로그아웃
	@GetMapping("/user/sign_out")
	public String signOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		session.removeAttribute("userId");
		session.removeAttribute("userLoginId");
		session.removeAttribute("nickname");
		session.removeAttribute("phoneNumber");
		
		return "redirect:/user/signin_view";
	}
}
