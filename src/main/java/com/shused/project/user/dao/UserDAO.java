package com.shused.project.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.shused.project.user.model.User;

@Repository
public interface UserDAO {
	
	// 회원가입 정보 insert
	public int insertUser(
			@Param("loginId") String loginId,
			@Param("password") String  password,
			@Param("nickname") String nickname,
			@Param("phoneNumber") String phoneNumber
			);
	
	// id, 닉네임, 전화번호 중복체크
	public int selectCountLoginId(@Param("loginId") String loginId);
	
	public int selectCountNickname(@Param("nickname") String nickname);
	
	public int selectCountPhoneNumber(@Param("phoneNumber") String phoneNumber);
	
	//로그인
	public User selectUser(
			@Param("loginId") String loginId,
			@Param("password") String password
			);
	

}
