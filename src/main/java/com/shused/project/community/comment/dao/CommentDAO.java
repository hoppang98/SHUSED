package com.shused.project.community.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.shused.project.community.comment.model.Comment;

@Repository
public interface CommentDAO {

	public int addComment(
			@Param("userId") int userId,
			@Param("userNickname") String userNickname,
			@Param("postId") int postId,
			@Param("content") String content
			);
	
	public List<Comment> selectCommentList(@Param("postId") int postId);
}
