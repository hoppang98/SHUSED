package com.shused.project.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {

	public final static String RECTNTLY_DROPPED_FILE_UPLOAD_PATH = "C:\\손지승\\New_Study\\1-3. MyProject\\recentlyDroppedImages/";
	public final static String USED_SHOES_FILE_UPLOAD_PATH = "C:\\손지승\\New_Study\\1-3. MyProject\\usedShoesImages/";
	public final static String COMMUNITY_FILE_UPLOAD_PATH = "C:\\손지승\\New_Study\\1-3. MyProject\\communityImages/";
	

	//배포시 아래쪽으로 변경
//	public final static String RECTNTLY_DROPPED_FILE_UPLOAD_PATH = "/home/ec2-user/shused/upload/images/recentlyDroppedImages/";
//	public final static String USED_SHOES_FILE_UPLOAD_PATH = "/home/ec2-user/shused/upload/images/usedShoesImages/";
//	public final static String COMMUNITY_FILE_UPLOAD_PATH = "/home/ec2-user/shused/upload/images/communityImages/";

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
	public static List<String> saveUsedShoesFile(int userId, List<MultipartFile> fileList) {

		if (fileList == null) {
			return null;
		}

		String directioryName = userId + "_" + System.currentTimeMillis() + "/";

		String filePath = USED_SHOES_FILE_UPLOAD_PATH + directioryName;
		
		List<String> realFilePath = new ArrayList<String>();
		
		File directiory = new File(filePath);
		if (directiory.mkdir() == false) {
			return null;
		}
		
		
		for(MultipartFile file : fileList) {

				byte[] bytes;
				try {
					bytes = file.getBytes();
					Path path = Paths.get(filePath + file.getOriginalFilename());
					Files.write(path, bytes);
					logger.info("/usedShoesImages/" + directioryName + file.getOriginalFilename());
					String realPath = "/usedShoesImages/" + directioryName + file.getOriginalFilename();
					realFilePath.add(realPath);	
				} catch (IOException e) {
					e.printStackTrace();
				}

			}	
			return realFilePath; // 이렇게 완성, 이후 dao나 mapper에서 반복문을 돌려서 저장한다
		}

	
		
		
	
	// 판매 신발 파일 삭제
	public static void removeUsedShoesFile(List<String> filePath) {
		
		if(filePath == null) {
			logger.error("FileManagerService::removeFile - 삭제할 파일 없음");
			return;
		}
		
		int filePathListSize = filePath.size();
		String fileArr[] = filePath.toArray(new String[filePathListSize]);
		
		for (int i = 0; i <= fileArr.length; i++) {
			String realFilePath = USED_SHOES_FILE_UPLOAD_PATH + fileArr[i].replace("/usedShoesImages/", "");
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

		String realFilePath = COMMUNITY_FILE_UPLOAD_PATH + filePath.replace("/communityImages/", "");

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