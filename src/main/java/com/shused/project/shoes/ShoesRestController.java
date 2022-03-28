package com.shused.project.shoes;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.shused.project.shoes.bo.ShoesBO;

@RestController
public class ShoesRestController {
	
	@Autowired
	private ShoesBO shoesBO;
	
	// 최근 발매 상품 저장 api
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
	
	
	
	// 판매 신발 저장 api
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
			@RequestParam("state") boolean state,
			@RequestParam("place") String place,
			@RequestParam("uploadFile") List<MultipartFile> fileList,
			HttpServletRequest request
			) {
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		String nickname = (String)session.getAttribute("nickname");
		String phoneNumber = (String)session.getAttribute("phoneNumber");
		
		int count = shoesBO.addUsedShoes(userId, nickname, phoneNumber, category, modelNumber, shoesName, size, price, condition, dealMethod, explanation, state, place, fileList);
		
		
		// 위 내용 저장과 동시에 판매 상품의 pk값 가져오는 방법 - useGeneratedKeys
		
		Map<String, String> result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		return result;
	}
	
	
	
//	@GetMapping("/shoes/delete")
//	public Map<String, String> deleteShoes(
//			@RequestParam("shoesId") int shoesId,
//			HttpServletRequest request
//			){
//		HttpSession session = request.getSession();
//		
//		int userId = (Integer)session.getAttribute("userId");
//		
//		//int count = shoesBO.deleteShoes(shoesId, userId);
//		Map<String, String> result = new HashMap<>();
//		
//		if(count == 1) {
//			result.put("result", "success");
//		} else {
//			result.put("result", "fail");
//		}
//		return result;
//	}
	
	@PostMapping("/shoes/soldOut")
	public Map<String, String> soldOut(
			@RequestParam("shoesId") int shoesId,
			HttpServletRequest request
			){
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		int count = shoesBO.soldOutShoes(shoesId, userId);
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		return result;
	}
}
