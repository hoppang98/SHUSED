package com.shused.project.shoes;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ShoesController {
	
	// 메인페이지로 이동
	@GetMapping("/shoes/mainPage_view")
	public String signupView() {
		return "/shoes/mainPage";
	}
	
}
