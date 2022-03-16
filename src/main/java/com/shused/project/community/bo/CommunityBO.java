package com.shused.project.community.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.shused.project.common.FileManagerService;
import com.shused.project.community.dao.CommunityDAO;
import com.shused.project.community.model.Post;

@Service
public class CommunityBO {

	@Autowired
	private CommunityDAO communityDAO;
	
	public int addPost(int userId, String userNickname, String subject, String content, MultipartFile file) {
		String filePath = FileManagerService.saveCommunityFile(userId, file);
		return communityDAO.insertPost(userId, userNickname, subject, content, filePath);
	}
	
	public List<Post> getPostList(){
		return communityDAO.selectPostList();
	}
}
