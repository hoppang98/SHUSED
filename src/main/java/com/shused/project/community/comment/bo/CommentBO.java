package com.shused.project.community.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shused.project.community.comment.dao.CommentDAO;
import com.shused.project.community.comment.model.Comment;

@Service
public class CommentBO {
	
	@Autowired
	private CommentDAO commentDAO;
	
	public int addComment(int userId, String userNickname, int postId, String content) {
		return commentDAO.addComment(userId, userNickname, postId, content);
	}
	
	public List<Comment> getCommentList(int postId){
		return commentDAO.selectCommentList(postId);
	}
}
