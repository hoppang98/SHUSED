package com.shused.project.shoes.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

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
}
