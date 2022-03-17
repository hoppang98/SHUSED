package com.shused.project.community.recommend;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.shused.project.community.recommend.bo.RecommendBO;

@RestController
public class RecommendRestController {

	@Autowired
	private RecommendBO recommendBO;
	
	@GetMapping("/recommend/like")
	public Map<String, Boolean> recommend (
			@RequestParam("postId") int postId,
			HttpServletRequest request
			){
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		boolean isRecommend = recommendBO.recommend(postId, userId);
		
		Map<String, Boolean> result = new HashMap<>();
		
		result.put("isRecommend", isRecommend);
		
		return result;
	}
}
