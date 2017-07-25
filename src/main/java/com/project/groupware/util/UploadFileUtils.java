package com.project.groupware.util;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.project.groupware.domain.ArticleFileVO;
import com.project.groupware.domain.DocumentFileVO;
import com.project.groupware.domain.EmployeeImageVO;
import com.project.groupware.domain.FormFileVO;

public class UploadFileUtils {
	
	private static int count = 1;
	public static String UPLOAD_PATH = "C:" + File.separator + "upload";
	
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
	
	public static FormFileVO uploadFormFile(MultipartFile file, HttpServletRequest request) throws Exception{
		String originalFileName = file.getOriginalFilename();
		long fileSize = file.getSize();
		String systemFileName = "";
		
		UPLOAD_PATH = request.getSession().getServletContext().getRealPath("/upload");
		
		File temp = new File(UPLOAD_PATH + File.separator + originalFileName);
		if(temp.exists()) {
			systemFileName = originalFileName.substring(0, originalFileName.lastIndexOf(".")) +
					"_" + count++ + originalFileName.substring(originalFileName.lastIndexOf("."));
		} else {
			systemFileName = originalFileName;
		}
		
		// copy file in memory or C:/tempUpload folder at C:/upload folder
		File dest = new File(UPLOAD_PATH + File.separator + systemFileName);
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		FormFileVO formFile = new FormFileVO();
		formFile.setOriginalFileName(originalFileName);
		formFile.setSystemFileName(systemFileName);
		formFile.setFileSize(fileSize);
		
		return formFile;		
	}
	
	public static DocumentFileVO uploadDocumentFile(MultipartFile file) throws Exception {
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
		
		DocumentFileVO documentFile = new DocumentFileVO();
		documentFile.setOriginalFileName(originalFileName);
		documentFile.setSystemFileName(systemFileName);
		documentFile.setFileSize(fileSize);
		
		return documentFile;	
	}
	
	public static EmployeeImageVO uploadImageFile(MultipartFile file, HttpServletRequest request) throws Exception {
		String IMAGE_UPLOAD_PATH = request.getSession().getServletContext().getRealPath("/upload");
		String originalFileName = file.getOriginalFilename();
		long fileSize = file.getSize();
		String systemFileName = "";
		
		File temp = new File(IMAGE_UPLOAD_PATH + File.separator + originalFileName);
		if(temp.exists()) {
			systemFileName = originalFileName.substring(0, originalFileName.lastIndexOf(".")) +
					"_" + count++ + originalFileName.substring(originalFileName.lastIndexOf("."));
		} else {
			systemFileName = originalFileName;
		}
		
		// copy file in memory or C:/tempUpload folder at C:/upload folder
		File dest = new File(IMAGE_UPLOAD_PATH + File.separator + systemFileName);
		file.transferTo(dest);
		
		EmployeeImageVO image = new EmployeeImageVO();
		image.setOriginalFileName(originalFileName);
		image.setSystemFileName(systemFileName);
		image.setFileSize(Long.toString(fileSize));
		
		return image;		
	}
}
