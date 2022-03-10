package com.shused.project.shoes;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.shused.project.shoes.bo.ShoesBO;

@RestController
public class ShoesRestController {
	
	@Autowired
	private ShoesBO shoesBO;
	
	// 최근 발매 상품 api
	@PostMapping("/shoes/dropped_shoes")
	public Map<String, String> DroppedShoes (
			@RequestParam("category") String category,
			@RequestParam("modelNumber") String modelNumber,
			@RequestParam("shoesName") String shoesName,
			@RequestParam("date") String date,
			@RequestParam("file") MultipartFile file,
			HttpServletRequest request
			){
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		String nickname = (String)session.getAttribute("nickname");
		
		int count = shoesBO.addDroppedShoes(userId, nickname, category, modelNumber, shoesName, date, file);
		
		Map<String, String> result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		return result;
	}
	
	// 최근 등록 상품 api
	@PostMapping("/shoes/usedShoes")
	public Map<String, String> usedShoes (
			@RequestParam("category") String category,
			@RequestParam("modelNumber") String modelNumber,
			@RequestParam("shoesName") String shoesName,
			@RequestParam("size") int size,
			@RequestParam("price") int price,
			@RequestParam("condition") String condition,
			@RequestParam("dealMethod") String dealMethod,
			@RequestParam("explanation") String explanation,
			@RequestParam("location") String location,
			@RequestParam("file") MultipartFile file,
			HttpServletRequest request
			){
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		String nickname = (String)session.getAttribute("nickname");
		String phoneNumber = (String)session.getAttribute("phoneNumber");
		
		int count = shoesBO.addUsedShoes(userId, nickname, phoneNumber, category, modelNumber, shoesName, size, price, condition, dealMethod, explanation, location, file);
		
		Map<String, String> result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		return result;
	}
}
