package com.shused.project.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.shused.project.common.FileManagerService;
import com.shused.project.common.PermissionInterceptor;

@Configuration
public class WebMVCConfig implements WebMvcConfigurer {
	
	@Autowired
	PermissionInterceptor permissionInterceptor;
	
	
	// 컴퓨터(서버)내 특정 경로를 클라이언트(브라우저)에서 특정 path로 접근 하도록 하는 설정
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/recentlyDroppedImages/**") // 클라이언트에서 접근하도록 하는 path
		.addResourceLocations("file:///" + FileManagerService.RECTNTLY_DROPPED_FILE_UPLOAD_PATH); // RECTNTLY_DROPPED_FILE_UPLOAD_PATH 경로 아래에 있는 모든 파일
		registry.addResourceHandler("/usedShoesImages/**") // 클라이언트에서 접근하도록 하는 path
		.addResourceLocations("file:///" + FileManagerService.USED_SHOES_FILE_UPLOAD_PATH); // USED_SHOES_FILE_UPLOAD_PATH 경로 아래에 있는 모든 파일
		registry.addResourceHandler("/communityImages/**") // 클라이언트에서 접근하도록 하는 path
		.addResourceLocations("file:///" + FileManagerService.COMMUNITY_FILE_UPLOAD_PATH); // COMMUNITY_FILE_UPLOAD_PATH 경로 아래에 있는 모든 파일
	}
	
	// 비 로그인시 메모 리스트에 접근 못하게 설정, 로그인시 로그인,회원가입 화면에 접근 못하도록 설정 - interceptor사용으로 모든 페이지가 interceptor를 거쳐가게 한다.
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(permissionInterceptor)
		.addPathPatterns("/**") //어떤 path가 interceptor를 거쳐서 수행될지 설정
		.excludePathPatterns("/static/**", "/images/**", "/user/sign_out"); // 제외할 path, /user/로 시작하는 로그아웃 기능 활성화를 위해 로그아웃도 추가
		
	}
}
