package com.shused.project.community.recommend.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shused.project.community.recommend.dao.RecommendDAO;

@Service
public class RecommendBO {

	@Autowired
	private RecommendDAO recommendDAO;
	
	// 리턴 : 좋아요 : true 좋아요 취소 : false
	public boolean recommend (int postId, int userId) {
		if(this.isRecommend(postId, userId) == true) {
			recommendDAO.deleteRecommend(postId, userId);
			return false;
		} else {
			recommendDAO.insertRecommend(postId, userId);
			return true;
		}
	}
	
	// 추천 눌렀는지 안 눌렀는지 확인하기 위해서
	public boolean isRecommend(int postId, int userId) {
		int count = recommendDAO.selectRecommendCountByUserId(postId, userId);
		if(count == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	public int getRecommendCount(int postId) {
		return recommendDAO.selectRecommendCount(postId);
	}
}
