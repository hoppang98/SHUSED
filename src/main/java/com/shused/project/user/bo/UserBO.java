package com.shused.project.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shused.project.common.EncryptUtils;
import com.shused.project.user.dao.UserDAO;
import com.shused.project.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	// 회원가입
	public int addUser(String loginId, String password, String nickname, String phoneNumber) {
		String encPassword = EncryptUtils.md5(phoneNumber);
		
		return userDAO.insertUser(loginId, encPassword, nickname, phoneNumber);
	}
	
	// 아이디, 닉네임, 전화번호 중복체크
	public boolean isDuplicateId(String loginId) {
		int count = userDAO.selectCountLoginId(loginId);
		if(count == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	public boolean isDuplicateNickname (String nickname) {
		int count = userDAO.selectCountNickname(nickname);
		if(count == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	public boolean isDuplicatePhoneNumber (String phoneNumber) {
		int count = userDAO.selectCountPhoneNumber(phoneNumber);
		if(count == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	// 로그인
	public User getUser(String loginId, String password) {
		String encPassword = EncryptUtils.md5(password);
		
		return userDAO.selectUser(loginId, encPassword);
	}
	

}
