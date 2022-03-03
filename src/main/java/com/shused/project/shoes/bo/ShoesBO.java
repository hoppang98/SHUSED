package com.shused.project.shoes.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.shused.project.common.FileManagerService;
import com.shused.project.shoes.dao.ShoesDAO;

@Service
public class ShoesBO {

	@Autowired
	private ShoesDAO shoesDAO;
	
	public int addDroppedShoes(int userId, String nickname, String category, String modelNumber, String shoesName, String date, MultipartFile file) {
		String filePath = FileManagerService.saveFile(userId, file);
		return shoesDAO.insertDroppedShoes(userId, nickname, category, modelNumber, shoesName, date, filePath);
	}
}
