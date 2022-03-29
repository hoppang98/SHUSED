package com.shused.project.shoes.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.shused.project.common.FileManagerService;
import com.shused.project.shoes.dao.ShoesDAO;
import com.shused.project.shoes.model.DroppedShoes;
import com.shused.project.shoes.model.InputFile;
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
		String List[] = fileListForInsert.toArray(new String[fileListForInsert.size()]);
		
		for(int i = 0; i <= List.length; i++) {
			InputFile inputfile;
			inputfile = new InputFile();
			inputfile.setUsedShoesId(usedShoes.getId());
			inputfile.setImagePath(List[i]);
			return shoesDAO.insertFileListForInsert(inputfile);
		}
		
		return shoesDAO.insertUsedShoes(usedShoes);
		
	} 
	
	//public List<String> addFilePath(int userId, List<MultipartFile> fileList) {
	//	List<String> filePath = FileManagerService.saveUsedShoesFile(userId, fileList);
	//	return 
	//}

	
	public List<UsedShoes> getUsedShoesList() {
		return shoesDAO.selectUsedShoes();
	}
	
	public List<InputFile> getInputFileList() {
		return shoesDAO.selectInputFile();
	}
	
	public UsedShoes getUsedShoesForDetail (int UsedShoesId) {
		return shoesDAO.selectUsedShoesForDetail(UsedShoesId);
	}
	
	public List<UsedShoes> getUsedShoesListByUserId(int userId) {
		return shoesDAO.selectUsedShoesByUserId(userId);
	}
	
	public int deleteShoes(int shoesId, int userId) {
//파일삭제 추가하기
		return shoesDAO.deleteShoes(shoesId, userId);
	}
	
	public int soldOutShoes(int shoesId, int userId) {
		return shoesDAO.soldOutShoes(shoesId, userId);
	}
	
	public List<UsedShoes> getUsedShoesListForSearch (String searchKeyword){
		return shoesDAO.selectUsedShoesForSearch(searchKeyword);
	}

}
