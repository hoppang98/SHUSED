package com.shused.project.shoes.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.shused.project.common.FileManagerService;
import com.shused.project.shoes.dao.ShoesDAO;
import com.shused.project.shoes.model.DroppedShoes;
import com.shused.project.shoes.model.InputFile;
import com.shused.project.shoes.model.SelectInputFile;
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
	
	
	public List<SelectInputFile> getInputFileList(){
		return shoesDAO.selectInputFileList();

	}
	

	
	
	public int addUsedShoes(int userId, String nickname, String phoneNumber, String category, String modelNumber, String shoesName, int size, int price, String condition, String dealMethod, String explanation, boolean state, String place, List<MultipartFile> fileList) {
		UsedShoes usedShoes;
		usedShoes = new UsedShoes();
		usedShoes.setUserId(userId);
		usedShoes.setNickname(nickname);
		usedShoes.setPhoneNumber(phoneNumber);
		usedShoes.setCategory(category);
		usedShoes.setModelNumber(modelNumber);
		usedShoes.setShoesName(shoesName);
		usedShoes.setSize(size);
		usedShoes.setPrice(price);
		usedShoes.setCondition(condition);
		usedShoes.setDealMethod(dealMethod);
		usedShoes.setExplanation(explanation);
		usedShoes.setState(state);
		usedShoes.setPlace(place);
		//usedShoes.setFileListForInsert(fileListForInsert);
		shoesDAO.insertUsedShoes(usedShoes);
		
		List<String> fileListForInsert = FileManagerService.saveUsedShoesFile(userId, fileList);
		InputFile inputfile;
		inputfile = new InputFile();
		inputfile.setUsedShoesId(usedShoes.getId());
		inputfile.setImagePath(fileListForInsert);
		
		return shoesDAO.insertFileListForInsert(inputfile);
	} 
	
	//public List<String> addFilePath(int userId, List<MultipartFile> fileList) {
	//	List<String> filePath = FileManagerService.saveUsedShoesFile(userId, fileList);
	//	return 
	//}

	
	public List<UsedShoes> getUsedShoesList() {
		return shoesDAO.selectUsedShoes();
	}
	
	
	
	public UsedShoes getUsedShoesForDetail (int UsedShoesId) {
		return shoesDAO.selectUsedShoesForDetail(UsedShoesId);
	}
	public List<SelectInputFile> SelectInputFileForDetail (int UsedShoesId) {
		return shoesDAO.SelectInputFileForDetail(UsedShoesId);
	}
	
	
	
	public List<UsedShoes> getUsedShoesListByUserId(int userId) {
		return shoesDAO.selectUsedShoesByUserId(userId);
	}
	
	
	
	
	public int deleteShoes(int shoesId, int userId) {
		
		List<String> filePath = shoesDAO.selectDeleteFilePath(shoesId);
		FileManagerService.removeUsedShoesFile(filePath);
		

		if (shoesDAO.deleteShoes(shoesId, userId) == 1) {
			shoesDAO.deleteShoes(shoesId, userId);
			shoesDAO.deleteFilePath(shoesId);
		}
		return shoesDAO.deleteShoes(shoesId, userId);
	}
	
	
	
	
	
	public int soldOutShoes(int shoesId, int userId) {
		return shoesDAO.soldOutShoes(shoesId, userId);
	}
	
	public List<UsedShoes> getUsedShoesListForSearch (String searchKeyword){	
		return shoesDAO.selectUsedShoesForSearch(searchKeyword);
	}
	
	
	public List<SelectInputFile> getInputFileListForSearch(){
		return shoesDAO.selectInputFileList();

	}

}
