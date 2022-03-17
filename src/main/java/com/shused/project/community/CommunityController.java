package com.shused.project.community;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shused.project.community.bo.CommunityBO;
import com.shused.project.community.comment.bo.CommentBO;
import com.shused.project.community.comment.model.Comment;
import com.shused.project.community.model.Post;
import com.shused.project.community.recommend.bo.RecommendBO;

@Controller
public class CommunityController {

	@Autowired
	private CommunityBO communityBO;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private RecommendBO recommendBO;
	
	//커뮤니티 페이지로 이동
	@GetMapping("/community/main_view")
	public String communityMainView(
			Model model
			) {
		
		List<Post> postlist = communityBO.getPostList();
		model.addAttribute("postlist", postlist);
		
		return "/community/main";
	}
	
	@GetMapping("/community/createPost_view")
	public String createView() {
		return "/community/createPost";
	}
	
	@GetMapping("/community/detailPost_view")
	public String detailView(
			@RequestParam("postId") int postId,
			Model model,
			HttpServletRequest request
			) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		Post post = communityBO.getPost(postId);
		List<Comment> commentList = commentBO.getCommentList(postId);
		
		boolean isRecommend = recommendBO.isRecommend(postId, userId);
		int recommendCount = recommendBO.getRecommendCount(postId);
		
		model.addAttribute("commentList", commentList);
		model.addAttribute("post", post);
		model.addAttribute("isRecommend", isRecommend);
		model.addAttribute("recommendCount", recommendCount);
		
		return "/community/detailPost";
	}
}
