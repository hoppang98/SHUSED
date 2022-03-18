package com.shused.project.community.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.shused.project.community.model.Post;

@Repository
public interface CommunityDAO {
	
	public int insertPost(
			@Param("userId") int userId,
			@Param("userNickname") String userNickname, 
			@Param("subject") String subject, 
			@Param("content") String content,
			@Param("imagePath") String imagePath
			);
	
	public List<Post> selectPostList();
	
	public Post selectPost(@Param("postId") int postId);
	
	public int deletePost(@Param("postId") int postId);
	
	public List<Post> selectPostByUserId(@Param("userId") int userId);
}
