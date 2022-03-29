package com.shused.project.shoes;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shused.project.shoes.bo.ShoesBO;
import com.shused.project.shoes.model.DroppedShoes;
import com.shused.project.shoes.model.InputFile;
import com.shused.project.shoes.model.UsedShoes;

@Controller
public class ShoesController {
	
	@Autowired
	private ShoesBO shoesBO;
	
	// 메인페이지로 이동
	@GetMapping("/shoes/mainPage_view")
	public String signupView(
			Model model
			) {
		
		List<DroppedShoes> DroppedShoesList = shoesBO.getDroppedShoesList();
		model.addAttribute("DroppedShoesList", DroppedShoesList);
		
		List<UsedShoes> UsedShoesList = shoesBO.getUsedShoesList();
		model.addAttribute("UsedShoesList", UsedShoesList);
		
		List<InputFile> inputFileList = shoesBO.getInputFileList();
		model.addAttribute("inputFileList", inputFileList);
		
		return "/shoes/mainPage";
	}
	
	// 최근 발매 상품 등록 페이지로 이동
	@GetMapping("/shoes/droppedShoes_view")
	public String recentlyDroppedView() {
		return "/shoes/droppedShoes";
	}
	
	
	// 판매 상품 등록 페이지로 이동
	@GetMapping("/shoes/usedShoes_view")
	public String usedShoesView() {
		return "/shoes/usedShoes";
	}
	
	
	@GetMapping("/shoes/detail_view")
	public String detailShoesView(
			@RequestParam("UsedShoesListId") int UsedShoesId,
			Model model
			) {
		
		UsedShoes usedShoes = shoesBO.getUsedShoesForDetail(UsedShoesId);
		
		model.addAttribute("usedShoes", usedShoes);
		
		return "/shoes/detailShoes";
	}
	
	@GetMapping("/shoes/search_view")
	public String searchShoewView(
			@RequestParam("searchKeyword") String searchKeyword,
			Model model
			) {
		
		List<UsedShoes> usedShoesSearchList = shoesBO.getUsedShoesListForSearch(searchKeyword);
		model.addAttribute("usedShoesSearchList", usedShoesSearchList);
		
		model.addAttribute("searchKeyword", searchKeyword);
		
		return "/shoes/searchShoes";
	}
}
