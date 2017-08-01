package com.project.groupware.util;

import java.io.File;
import java.io.IOException;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.project.groupware.domain.ArticleFileVO;
import com.project.groupware.domain.ArticleImageVO;
import com.project.groupware.domain.DocumentFileVO;
import com.project.groupware.domain.EmployeeImageVO;
import com.project.groupware.domain.FormFileVO;

public class UploadFileUtils {

	private static int count = 1;
	public static String UPLOAD_PATH = "C:" + File.separator + "upload";

	public static String getUploadPath(HttpServletRequest request) {
		UPLOAD_PATH = request.getSession().getServletContext().getRealPath("/upload");

		return UPLOAD_PATH;
	}

	public static FormFileVO uploadFormFile(MultipartFile file, HttpServletRequest request) throws Exception {
		String originalFileName = file.getOriginalFilename();
		long fileSize = file.getSize();
		String systemFileName = "";

		// 디렉토리 생성
		File destFolder = new File(getUploadPath(request) + File.separator + "form");

		// 대상폴더가 없으면 생성
		if (!destFolder.exists()) {
			destFolder.mkdirs();
		}

		File temp = new File(destFolder.getAbsolutePath() + File.separator + originalFileName);
		if (temp.exists()) {
			systemFileName = originalFileName.substring(0, originalFileName.lastIndexOf(".")) + "_" + count++
					+ originalFileName.substring(originalFileName.lastIndexOf("."));
		} else {
			systemFileName = originalFileName;
		}

		// copy file in memory or C:/tempUpload folder at C:/upload folder
		File dest = new File(destFolder.getAbsolutePath() + File.separator + systemFileName);
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

	public static DocumentFileVO uploadDocumentFile(MultipartFile file, HttpServletRequest request) throws Exception {
		String originalFileName = file.getOriginalFilename();
		long fileSize = file.getSize();
		String systemFileName = "";

		// 디렉토리 생성
		File destFolder = new File(getUploadPath(request) + File.separator + "document");

		// 대상폴더가 없으면 생성
		if (!destFolder.exists()) {
			destFolder.mkdirs();
		}

		UPLOAD_PATH = destFolder.getAbsolutePath();

		File temp = new File(destFolder.getAbsolutePath() + File.separator + originalFileName);
		if (temp.exists()) {
			systemFileName = originalFileName.substring(0, originalFileName.lastIndexOf(".")) + "_" + count++
					+ originalFileName.substring(originalFileName.lastIndexOf("."));
		} else {
			systemFileName = originalFileName;
		}

		// copy file in memory or C:/tempUpload folder at C:/upload folder
		File dest = new File(destFolder.getAbsolutePath() + File.separator + systemFileName);
		file.transferTo(dest);

		DocumentFileVO documentFile = new DocumentFileVO();
		documentFile.setOriginalFileName(originalFileName);
		documentFile.setSystemFileName(systemFileName);
		documentFile.setFileSize(fileSize);

		return documentFile;
	}

	public static EmployeeImageVO uploadImageFile(MultipartFile file, HttpServletRequest request) throws Exception {

		String originalFileName = file.getOriginalFilename();
		long fileSize = file.getSize();
		String systemFileName = "";

		// 디렉토리 생성
		File destFolder = new File(getUploadPath(request) + File.separator + "empImage");

		// 대상폴더가 없으면 생성
		if (!destFolder.exists()) {
			destFolder.mkdirs();
		}

		UPLOAD_PATH = destFolder.getAbsolutePath();

		File temp = new File(destFolder.getAbsolutePath() + File.separator + originalFileName);
		if (temp.exists()) {
			systemFileName = originalFileName.substring(0, originalFileName.lastIndexOf(".")) + "_" + count++
					+ originalFileName.substring(originalFileName.lastIndexOf("."));
		} else {
			systemFileName = originalFileName;
		}

		// copy file in memory or C:/tempUpload folder at C:/upload folder
		File dest = new File(destFolder.getAbsolutePath() + File.separator + systemFileName);
		file.transferTo(dest);

		EmployeeImageVO image = new EmployeeImageVO();
		image.setOriginalFileName(originalFileName);
		image.setSystemFileName(systemFileName);
		image.setFileSize(Long.toString(fileSize));

		return image;
	}

	public static ArticleImageVO uploadFile1(MultipartFile file, HttpServletRequest request) throws Exception {
		String originalImageName = file.getOriginalFilename();
		long fileSize = file.getSize();
		String systemImageName = "";

		// 디렉토리 생성
		File destFolder = new File(getUploadPath(request) + File.separator + "article");

		// 대상폴더가 없으면 생성
		if (!destFolder.exists()) {
			destFolder.mkdirs();
		}

		// request.getSession().getServletContext().getRealPath("/upload");
		UPLOAD_PATH = destFolder.getAbsolutePath();

		File temp = new File(destFolder.getAbsolutePath() + File.separator + originalImageName);
		if (temp.exists()) {
			systemImageName = originalImageName.substring(0, originalImageName.lastIndexOf(".")) + "_" + count++
					+ originalImageName.substring(originalImageName.lastIndexOf("."));
		} else {
			systemImageName = originalImageName;
		}

		// copy file in memory or C:/tempUpload folder at C:/upload folder
		File dest = new File(destFolder.getAbsolutePath() + File.separator + systemImageName);
		file.transferTo(dest);

		ArticleImageVO articleImage = new ArticleImageVO();
		articleImage.setOriginalImageName(originalImageName);
		articleImage.setSystemImageName(systemImageName);
		articleImage.setFileSize(fileSize);

		return articleImage;

	}

	public static ArticleFileVO uploadFile(MultipartFile file, HttpServletRequest request) throws Exception {
		String originalFileName = file.getOriginalFilename();
		long fileSize = file.getSize();
		String systemFileName = "";

		// 디렉토리 생성
		File destFolder = new File(getUploadPath(request) + File.separator + "article");

		// 대상폴더가 없으면 생성
		if (!destFolder.exists()) {
			destFolder.mkdirs();
		}

		File temp = new File(destFolder.getAbsolutePath() + File.separator + originalFileName);
		if (temp.exists()) {
			systemFileName = originalFileName.substring(0, originalFileName.lastIndexOf(".")) + "_" + count++
					+ originalFileName.substring(originalFileName.lastIndexOf("."));
		} else {
			systemFileName = originalFileName;
		}

		// copy file in memory or C:/tempUpload folder at C:/upload folder
		File dest = new File(destFolder.getAbsolutePath() + File.separator + systemFileName);
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		ArticleFileVO articleFile = new ArticleFileVO();
		articleFile.setOriginalFileName(originalFileName);
		articleFile.setSystemFileName(systemFileName);
		articleFile.setFileSize(fileSize);

		return articleFile;
	}
}
