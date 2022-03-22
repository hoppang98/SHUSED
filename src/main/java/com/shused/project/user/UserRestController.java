package com.shused.project.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.shused.project.user.bo.UserBO;
import com.shused.project.user.model.User;

@RestController
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	// 회원가입
	@PostMapping("/user/sign_up")
	public Map<String, String> signUp(		
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			@RequestParam("nickname") String nickname,
			@RequestParam("phoneNumber") String phoneNumber
			){

			int count = userBO.addUser(loginId, password, nickname, phoneNumber);
			
			Map<String, String> result = new HashMap<>();
			if(count == 1) {
				result.put("result", "success");
			} else {
				result.put("result", "fail");
			}
			return result;
	}
	
	// id 중복확인
	@GetMapping("/user/is_duplicate_id")
	public Map<String, Boolean> duplicateId(
			@RequestParam("loginId") String loginId
			){
		Map<String, Boolean> result = new HashMap<>();
		
		if(userBO.isDuplicateId(loginId)) {
			result.put("isDuplicate", true);
		} else {
			result.put("isDuplicate", false);
		}
		return result;
	}
	
	// 닉네임 중복확인
	@GetMapping("/user/is_duplicate_nickname")
	public Map<String, Boolean> duplicateNickname(
			@RequestParam("nickname") String nickname
			){
		Map<String, Boolean> result = new HashMap<>();
		
		if(userBO.isDuplicateNickname(nickname)) {
			result.put("isDuplicate", true);
		} else {
			result.put("isDuplicate", false);
		}
		return result;
	}
	
	// 전화번호 중복확인
	@GetMapping("/user/is_duplicate_phoneNumber")
	public Map<String, Boolean> duplicatePhoneNumber(
			@RequestParam("phoneNumber") String phoneNumber
			){
		Map<String, Boolean> result = new HashMap<>();
		
		if(userBO.isDuplicatePhoneNumber(phoneNumber)) {
			result.put("isDuplicate", true);
		} else {
			result.put("isDuplicate", false);
		}
		return result;
	}
	
	
	// 로그인
	@PostMapping("/user/sign_in")
	public Map<String, String> signIn(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpServletRequest request
			){
		
		User user = userBO.getUser(loginId, password);
		Map<String, String> result = new HashMap<>();
		
		if(user != null) {
			result.put("result", "success");
			HttpSession session = request.getSession();
			
			session.setAttribute("userId", user.getId());
			//session.setAttribute("userLoginId", user.getLoginId());
			session.setAttribute("nickname", user.getNickname());
			session.setAttribute("phoneNumber", user.getPhoneNumber());
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
}
