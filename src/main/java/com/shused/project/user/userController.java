package com.shused.project.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.shused.project.community.bo.CommunityBO;
import com.shused.project.community.model.Post;
import com.shused.project.shoes.bo.ShoesBO;
import com.shused.project.shoes.model.SelectInputFile;
import com.shused.project.shoes.model.UsedShoes;

@Controller
public class UserController {
	
	@Autowired
	private CommunityBO communityBO;
	
	@Autowired
	private ShoesBO shoesBO;
	
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
		//session.removeAttribute("userLoginId");
		session.removeAttribute("nickname");
		session.removeAttribute("phoneNumber");
		
		return "redirect:/user/signin_view";
	}
	
	// 마이페이지 이동
	@GetMapping("/login/user/mypage_view")
	public String mypageView(
			HttpServletRequest request,
			Model model
			) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		List<UsedShoes> myUsedShoesList = shoesBO.getUsedShoesListByUserId(userId);
		model.addAttribute("myUsedShoesList",myUsedShoesList);
		
		List<Post> myPostlist = communityBO.getPostByUserId(userId);
		model.addAttribute("myPostlist",myPostlist);
		
		List<SelectInputFile> SelectInputFileListForMypage = shoesBO.getInputFileListForSearch();
		model.addAttribute("SelectInputFileListForMypage", SelectInputFileListForMypage);
		
		return "/user/mypage";
	}
}
