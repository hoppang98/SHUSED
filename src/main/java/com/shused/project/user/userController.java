package com.shused.project.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class userController {
	
	// 회원가입 view로 이동
	@GetMapping("/user/signup_view")
	public String signupView() {
		return "/user/signUp";
	}
	
}
