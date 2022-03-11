package com.shused.project.shoes.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.shused.project.common.FileManagerService;
import com.shused.project.shoes.dao.ShoesDAO;
import com.shused.project.shoes.model.DroppedShoes;
import com.shused.project.shoes.model.UsedShoes;

@Service
public class ShoesBO {

	@Autowired
	private ShoesDAO shoesDAO;
	
	public int addDroppedShoes(int userId, String nickname, String category, String modelNumber, String shoesName, String date, MultipartFile file) {
		String filePath = FileManagerService.saveRecentlyDroppedFile(userId, file);
		return shoesDAO.insertDroppedShoes(userId, nickname, category, modelNumber, shoesName, date, filePath);
	}
	
	public List<DroppedShoes> getDroppedShoesList() {
		return shoesDAO.selectDroppesShoes();
	}
	
	
	public int addUsedShoes(int userId, String nickname, String phoneNumber, String category, String modelNumber, String shoesName, int size, int price, String condition, String dealMethod, String explanation, String location, MultipartFile file) {
		String filePath = FileManagerService.saveUsedShoesFile(userId, file);
		return shoesDAO.insertUsedShoes(userId, nickname, phoneNumber, category, modelNumber, shoesName, size, price, condition, dealMethod, explanation, location, filePath);
	}
	
	public List<UsedShoes> getUsedShoesList() {
		return shoesDAO.selectUsedShoes();
	}
}
