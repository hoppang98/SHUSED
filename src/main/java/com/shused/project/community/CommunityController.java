package com.shused.project.community;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shused.project.community.bo.CommunityBO;
import com.shused.project.community.model.Post;

@Controller
public class CommunityController {

	@Autowired
	private CommunityBO communityBO;
	
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
			Model model
			) {
		Post post = communityBO.getPost(postId);
		
		model.addAttribute("post", post);
		
		return "/community/detailPost";
	}
}
