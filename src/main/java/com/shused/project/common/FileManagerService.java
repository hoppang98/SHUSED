package com.shused.project.common;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {
	
	public final static String RECTNTLY_DROPPED_FILE_UPLOAD_PATH = "C:\\손지승\\New_Study\\1-3. MyProject\\recentlyDroppedImages/";
	public final static String USED_SHOES_FILE_UPLOAD_PATH = "C:\\손지승\\New_Study\\1-3. MyProject\\usedShoesImages/";
	public final static String COMMUNITY_FILE_UPLOAD_PATH = "C:\\손지승\\New_Study\\1-3. MyProject\\communityImages/";
	
	private static Logger logger = LoggerFactory.getLogger(FileManagerService.class);
	
	// 최근 발매 신발 파일 저장
	public static String saveRecentlyDroppedFile(int userId, MultipartFile file) {
		if(file == null ) {
			return null;
		}
		
		String directioryName = userId + "_" + System.currentTimeMillis() + "/";
		
		String filePath = RECTNTLY_DROPPED_FILE_UPLOAD_PATH + directioryName;
		
		File directiory = new File(filePath);
		if(directiory.mkdir() == false) {
			return null;
		}
		
		try {
			byte[] bytes = file.getBytes();
			Path path = Paths.get(filePath + file.getOriginalFilename());
			Files.write(path, bytes);
			
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		
		logger.info("/recentlyDroppedImages/" + directioryName + file.getOriginalFilename());
		return "/recentlyDroppedImages/" + directioryName + file.getOriginalFilename();
	}
	
	// 최근 발매 신발 파일 삭제
	public static void removeRecentlyDroppedFile(String filePath) {
		if(filePath == null) {
			logger.error("FileManagerService::removeFile - 삭제할 파일 없음");
			return;
		}

		String realFilePath = RECTNTLY_DROPPED_FILE_UPLOAD_PATH + filePath.replace("/recentlyDroppedImages/", "");

		Path path = Paths.get(realFilePath);

		if (Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				logger.error("FileManagerService::removeFile - 파일 삭제 실패");
				e.printStackTrace();
			}
		}

		path = path.getParent();

		if (Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				logger.error("FileManagerService::removeFile - 디렉토리 삭제 실패");
				e.printStackTrace();
			}
		}
	}
	
	
	
	
	
	// 판매 신발 파일 저장
	public static String saveUsedShoesFile(int userId, MultipartFile[] file) {
		
		if(file == null ) {
			return null;
		}
		
		String directioryName = userId + "_" + System.currentTimeMillis() + "/";
		
		String filePath = USED_SHOES_FILE_UPLOAD_PATH + directioryName;
		
		File directiory = new File(filePath);
		if(directiory.mkdir() == false) {
			return null;
		}
		
		for(MultipartFile multipartFile : file) {
				byte[] bytes = multipartFile.getBytes();
				Path path = Paths.get(filePath + multipartFile.getOriginalFilename());
				logger.info("업로드 파일 명 : " + multipartFile.getOriginalFilename());
				Files.write(path, bytes);
				return "/usedShoesImages/" + directioryName + multipartFile.getOriginalFilename();
				logger.info("/usedShoesImages/" + directioryName + multipartFile.getOriginalFilename());
		}
		
		
		
		
		

		

	}
	
	// 판매 신발 파일 삭제
	public static void removeUsedShoesFile(String filePath) {
		if(filePath == null) {
			logger.error("FileManagerService::removeFile - 삭제할 파일 없음");
			return;
		}

		String realFilePath = USED_SHOES_FILE_UPLOAD_PATH + filePath.replace("/usedShoesImages/", "");

		Path path = Paths.get(realFilePath);

		if (Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				logger.error("FileManagerService::removeFile - 파일 삭제 실패");
				e.printStackTrace();
			}
		}

		path = path.getParent();

		if (Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				logger.error("FileManagerService::removeFile - 디렉토리 삭제 실패");
				e.printStackTrace();
			}
		}
	}
	
	
	
	
	
	// 커뮤니티 파일 저장
	public static String saveCommunityFile(int userId, MultipartFile file) {
		if(file == null ) {
			return null;
		}
		
		String directioryName = userId + "_" + System.currentTimeMillis() + "/";
		
		String filePath = COMMUNITY_FILE_UPLOAD_PATH + directioryName;
		
		File directiory = new File(filePath);
		if(directiory.mkdir() == false) {
			return null;
		}
		
		try {
			byte[] bytes = file.getBytes();
			Path path = Paths.get(filePath + file.getOriginalFilename());
			Files.write(path, bytes);
			
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		
		logger.info("/communityImages/" + directioryName + file.getOriginalFilename());
		return "/communityImages/" + directioryName + file.getOriginalFilename();
	}
	
	// 커뮤니티 파일 삭제
	public static void removeCommunityFile(String filePath) {
		if(filePath == null) {
			logger.error("FileManagerService::removeFile - 삭제할 파일 없음");
			return;
		}

		String realFilePath = COMMUNITY_FILE_UPLOAD_PATH + filePath.replace("/CommunityImages/", "");

		Path path = Paths.get(realFilePath);

		if (Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				logger.error("FileManagerService::removeFile - 파일 삭제 실패");
				e.printStackTrace();
			}
		}

		path = path.getParent();

		if (Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				logger.error("FileManagerService::removeFile - 디렉토리 삭제 실패");
				e.printStackTrace();
			}
		}
	}
	
}