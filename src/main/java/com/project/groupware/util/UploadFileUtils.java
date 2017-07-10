package com.project.groupware.util;

import java.io.File;

public class UploadFileUtils {
	
	private static int count = 1;
	public static final String UPLOAD_PATH = "C:" + File.separator + "upload";
	
	/*public static ArticleFileVO uploadFile(MultipartFile file) throws Exception {
		String originalFileName = file.getOriginalFilename();
		long fileSize = file.getSize();
		String systemFileName = "";
		
		File temp = new File(UPLOAD_PATH + File.separator + originalFileName);
		if(temp.exists()) {
			systemFileName = originalFileName.substring(0, originalFileName.lastIndexOf(".")) +
					"_" + count++ + originalFileName.substring(originalFileName.lastIndexOf("."));
		} else {
			systemFileName = originalFileName;
		}
		
		// copy file in memory or C:/tempUpload folder at C:/upload folder
		File dest = new File(UPLOAD_PATH + File.separator + systemFileName);
		file.transferTo(dest);
		
		ArticleFileVO articleFile = new ArticleFileVO();
		articleFile.setOriginalFileName(originalFileName);
		articleFile.setSystemFileName(systemFileName);
		articleFile.setFileSize(fileSize);
		
		return articleFile;		
	}*/
}
