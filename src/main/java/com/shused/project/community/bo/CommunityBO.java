package com.shused.project.community.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.shused.project.common.FileManagerService;
import com.shused.project.community.comment.dao.CommentDAO;
import com.shused.project.community.dao.CommunityDAO;
import com.shused.project.community.model.Post;
import com.shused.project.community.recommend.dao.RecommendDAO;

@Service
public class CommunityBO {

	@Autowired
	private CommunityDAO communityDAO;
	
	@Autowired
	private CommentDAO commentDAO;
	
	@Autowired
	private RecommendDAO recommendDAO;
	
	
	public int addPost(int userId, String userNickname, String subject, String content, MultipartFile file) {
		String filePath = FileManagerService.saveCommunityFile(userId, file);
		return communityDAO.insertPost(userId, userNickname, subject, content, filePath);
	}
	
	public List<Post> getPostList(){
		return communityDAO.selectPostList();
	}
	
	public Post getPost(int postId) {
		return communityDAO.selectPost(postId);
	}
	
	public int deleteCommunityPost(int postId, int userId) {
		Post post = communityDAO.selectPost(postId);
		if(post.getUserId() != userId) {
			return 0;
		}
		FileManagerService.removeCommunityFile(post.getImagePath());
		
		commentDAO.deleteCommentByCommunityPost(postId);
		recommendDAO.deleteRecommendByCommunityPostId(postId);
		
		return communityDAO.deletePost(postId);
	}
	
	public List<Post> getPostByUserId(int userId) {
		return communityDAO.selectPostByUserId(userId);
	}
}
