package com.project.groupware.util;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.project.groupware.domain.ArticleFileVO;
import com.project.groupware.domain.ArticleImageVO;

public class UploadFileUtils2 {
   
   private static int count = 1;
   public static String UPLOAD_PATH = "C:" + File.separator + "upload";
   
   public static ArticleFileVO uploadFile(MultipartFile file, HttpServletRequest request) throws Exception {
      String originalFileName = file.getOriginalFilename();
      long fileSize = file.getSize();
      String systemFileName = "";
      
      
      UPLOAD_PATH = request.getSession().getServletContext().getRealPath("/upload");
      System.out.println("UPLOAD_PATH : " + UPLOAD_PATH);
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
   }
   
/*   public static ArticleImageVO uploadFile1(MultipartFile file,  HttpServletRequest request) throws Exception {
      String originalImageName = file.getOriginalFilename();
      long fileSize = file.getSize();
      String systemImageName = "";
      
      UPLOAD_PATH = request.getSession().getServletContext().getRealPath("/upload");
      System.out.println("UPLOAD_PATH : " + UPLOAD_PATH);
      File temp = new File(UPLOAD_PATH + File.separator + originalImageName);
      if(temp.exists()) {
         systemImageName = originalImageName.substring(0, originalImageName.lastIndexOf(".")) +
               "_" + count++ + originalImageName.substring(originalImageName.lastIndexOf("."));
      } else {
         systemImageName = originalImageName;
      }
      
      // copy file in memory or C:/tempUpload folder at C:/upload folder
      File dest = new File(UPLOAD_PATH + File.separator + systemImageName);
      file.transferTo(dest);
      
      ArticleImageVO articleImage = new ArticleImageVO();
      articleImage.setOriginalImageName(originalImageName);
      articleImage.setSystemImageName(systemImageName);
      articleImage.setFileSize(fileSize);
      
      return articleImage;      
   }*/
}
	
/*public static FormFileVO uploadFormFile(MultipartFile file, HttpServletRequest request) throws Exception{
		String originalFileName = file.getOriginalFilename();
		long fileSize = file.getSize();
		String systemFileName = "";
		
		
		// 디렉토리 생성
		File destFolder = new File(request.getSession().getServletContext().getRealPath("/upload/form"));
		
		// 대상폴더가 없으면 생성
		if(!destFolder.exists()) {
			destFolder.mkdirs();
		}
		
		//request.getSession().getServletContext().getRealPath("/upload");
		UPLOAD_PATH = destFolder.getAbsolutePath();
		
		
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
	
	public static DocumentFileVO uploadDocumentFile(MultipartFile file, HttpServletRequest request) throws Exception {
		String originalFileName = file.getOriginalFilename();
		long fileSize = file.getSize();
		String systemFileName = "";
		
		// 디렉토리 생성
		File destFolder = new File(request.getSession().getServletContext().getRealPath("/upload/document"));
		
		// 대상폴더가 없으면 생성
		if(!destFolder.exists()) {
			destFolder.mkdirs();
		}
		
		//request.getSession().getServletContext().getRealPath("/upload");
		UPLOAD_PATH = destFolder.getAbsolutePath();
		
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
		//String IMAGE_UPLOAD_PATH = request.getSession().getServletContext().getRealPath("/upload/empImage");
		String originalFileName = file.getOriginalFilename();
		long fileSize = file.getSize();
		String systemFileName = "";
		
		// 디렉토리 생성
		File destFolder = new File(request.getSession().getServletContext().getRealPath("/upload/empImage"));
		
		// 대상폴더가 없으면 생성
		if(!destFolder.exists()) {
			destFolder.mkdirs();
		}
		
		//request.getSession().getServletContext().getRealPath("/upload");
		UPLOAD_PATH = destFolder.getAbsolutePath();
		
		
		
		
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
		
		EmployeeImageVO image = new EmployeeImageVO();
		image.setOriginalFileName(originalFileName);
		image.setSystemFileName(systemFileName);
		image.setFileSize(Long.toString(fileSize));
		
		return image;		
	}*/

