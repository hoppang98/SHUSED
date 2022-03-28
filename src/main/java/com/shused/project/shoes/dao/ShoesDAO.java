package com.shused.project.shoes.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.shused.project.shoes.model.DroppedShoes;
import com.shused.project.shoes.model.InputFile;
import com.shused.project.shoes.model.UsedShoes;

@Repository
public interface ShoesDAO {

	public int insertDroppedShoes(
			@Param("userId") int userId,
			@Param("nickname") String nickname,
			@Param("category") String category,
			@Param("modelNumber") String modelNumber,
			@Param("shoesName") String shoesName,
			@Param("date") String date,
			@Param("imagePath") String imagePath
			);

	
	
	
	public List<DroppedShoes> selectDroppesShoes();
	
	
	
	
	
	// 판매 신발 저장
	public int insertUsedShoes(UsedShoes usedShoes);
	
	//판매 신발 사진 저장
	public int insertFileListForInsert(InputFile inputfile);
	
//	public UsedShoes insertFileListForInsert(
//			@Param("id") int id
//			,@Param("fileListForInsert") List<String> fileListForInsert
//			); // map처럼 만들어야한다. -> 모델객체로 해보자
	
	
	
//	public int insertUsedShoes(
//			@Param("userId") int userId,
//			@Param("nickname") String nickname,
//			@Param("phoneNumber") String phoneNumber,
//			@Param("category") String category,
//			@Param("modelNumber") String modelNumber,
//			@Param("shoesName") String shoesName,
//			@Param("size") int size, 
//			@Param("price") int price, 
//			@Param("condition") String condition, 
//			@Param("dealMethod") String dealMethod, 
//			@Param("explanation") String explanation, 
//			@Param("state") boolean state,
//			@Param("place") String place
			//@Param("fileListForInsert") List<String> fileListForInsert
			//@Param("imagePath") String imagePath
			//);
	

	
	
	
	
	public List<UsedShoes> selectUsedShoes();
	
	public UsedShoes selectUsedShoesForDetail (@Param("UsedShoesId") int UsedShoesId);

	public List<UsedShoes> selectUsedShoesByUserId(@Param("userId") int UserId);
	
	public int deleteShoes(
			@Param("shoesId") int shoesId,
			@Param("userId") int userId
			);
	
	public int soldOutShoes(
			@Param("shoesId") int shoesId,
			@Param("userId") int userId
			);
	
	public List<UsedShoes> selectUsedShoesForSearch(@Param("searchKeyword") String searchKeyword);
}
