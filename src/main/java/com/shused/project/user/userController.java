package com.shused.project.user;

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
	
}
