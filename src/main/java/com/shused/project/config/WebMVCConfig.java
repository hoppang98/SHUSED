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
	
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/recentlyDroppedImages/**") // 클라이언트에서 접근하도록 하는 path
		.addResourceLocations("file:///" + FileManagerService.RECTNTLY_DROPPED_FILE_UPLOAD_PATH); // RECTNTLY_DROPPED_FILE_UPLOAD_PATH 경로 아래에 있는 모든 파일
		registry.addResourceHandler("/usedShoesImages/**") // 클라이언트에서 접근하도록 하는 path
		.addResourceLocations("file:///" + FileManagerService.USED_SHOES_FILE_UPLOAD_PATH); // USED_SHOES_FILE_UPLOAD_PATH 경로 아래에 있는 모든 파일
		registry.addResourceHandler("/communityImages/**") // 클라이언트에서 접근하도록 하는 path
		.addResourceLocations("file:///" + FileManagerService.COMMUNITY_FILE_UPLOAD_PATH); // COMMUNITY_FILE_UPLOAD_PATH 경로 아래에 있는 모든 파일
<<<<<<< Updated upstream
=======
// 배포시 아래쪽으로 변경	
//		registry.addResourceHandler("/recentlyDroppedImages/**") // 클라이언트에서 접근하도록 하는 path
//		.addResourceLocations("file:/" + FileManagerService.RECTNTLY_DROPPED_FILE_UPLOAD_PATH); // RECTNTLY_DROPPED_FILE_UPLOAD_PATH 경로 아래에 있는 모든 파일
//		registry.addResourceHandler("/usedShoesImages/**") // 클라이언트에서 접근하도록 하는 path
//		.addResourceLocations("file:/" + FileManagerService.USED_SHOES_FILE_UPLOAD_PATH); // USED_SHOES_FILE_UPLOAD_PATH 경로 아래에 있는 모든 파일
//		registry.addResourceHandler("/communityImages/**") // 클라이언트에서 접근하도록 하는 path
//		.addResourceLocations("file:/" + FileManagerService.COMMUNITY_FILE_UPLOAD_PATH); // COMMUNITY_FILE_UPLOAD_PATH 경로 아래에 있는 모든 파일
>>>>>>> Stashed changes
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(permissionInterceptor)
		.addPathPatterns("/**") 
		.excludePathPatterns("/static/**", "/images/**", "/user/sign_out"); 
		
	}
}
