package com.shused.project.community.recommend.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface RecommendDAO {

	public int insertRecommend(
			@Param("postId") int postId,
			@Param("userId") int userId
			);
	
	public int deleteRecommend(
			@Param("postId") int postId,
			@Param("userId") int userId
			);
	
	// 추천 눌렀는지 안 눌렀는지 확인하기 위해서
	public int selectRecommendCountByUserId(
			@Param("postId") int postId,
			@Param("userId") int userId
			);
	
	public int selectRecommendCount(@Param("postId") int postId);
	
	public int deleteRecommendByCommunityPostId(@Param("postId") int postId);
}
