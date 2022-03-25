package com.shused.project.shoes.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.shused.project.shoes.model.DroppedShoes;
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
	
	public int insertUsedShoes(
			@Param("userId") int userId,
			@Param("nickname") String nickname,
			@Param("phoneNumber") String phoneNumber,
			@Param("category") String category,
			@Param("modelNumber") String modelNumber,
			@Param("shoesName") String shoesName,
			@Param("size") int size, 
			@Param("price") int price, 
			@Param("condition") String condition, 
			@Param("dealMethod") String dealMethod, 
			@Param("explanation") String explanation, 
			@Param("state") boolean state,
			@Param("place") String place
			//@Param("fileListForInsert") List<String> fileListForInsert
			//@Param("imagePath") String imagePath
			);
	
	public UsedShoes insertFileListForInsert(@Param("usedShoesId") int usedShoesId);
	
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
