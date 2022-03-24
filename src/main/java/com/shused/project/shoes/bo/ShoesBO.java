package com.shused.project.shoes.bo;

import java.io.IOException;
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
	
	
	public int addUsedShoes(int userId, String nickname, String phoneNumber, String category, String modelNumber, String shoesName, int size, int price, String condition, String dealMethod, String explanation, boolean state, String place) {
		return shoesDAO.insertUsedShoes(userId, nickname, phoneNumber, category, modelNumber, shoesName, size, price, condition, dealMethod, explanation, state, place);
	} // 여기서 사진 업로드까지 처리하기.... 아래는 지워야겠네
	
	public List<String> addFilePath(int userId, List<MultipartFile> fileList) {
		List<String> filePath = FileManagerService.saveUsedShoesFile(userId, fileList);
		return 
	}
	
	public List<UsedShoes> getUsedShoesList() {
		return shoesDAO.selectUsedShoes();
	}
	
	public UsedShoes getUsedShoesForDetail (int UsedShoesId) {
		return shoesDAO.selectUsedShoesForDetail(UsedShoesId);
	}
	
	public List<UsedShoes> getUsedShoesListByUserId(int userId) {
		return shoesDAO.selectUsedShoesByUserId(userId);
	}
	
//	public int deleteShoes(int shoesId, int userId) {
//		UsedShoes usedShoes = shoesDAO.selectUsedShoesForDetail(shoesId);
//		FileManagerService.removeUsedShoesFile(usedShoes.getImagePath());
//		return shoesDAO.deleteShoes(shoesId, userId);
//	}
	
	public int soldOutShoes(int shoesId, int userId) {
		return shoesDAO.soldOutShoes(shoesId, userId);
	}
	
	public List<UsedShoes> getUsedShoesListForSearch (String searchKeyword){
		return shoesDAO.selectUsedShoesForSearch(searchKeyword);
	}

}
