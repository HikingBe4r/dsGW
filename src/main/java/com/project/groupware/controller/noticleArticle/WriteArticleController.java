package com.project.groupware.controller.noticleArticle;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.project.groupware.domain.ArticleFileVO;
import com.project.groupware.domain.ArticleImageVO;
import com.project.groupware.domain.ArticleVO;
import com.project.groupware.service.NoticeArticleService;
import com.project.groupware.util.UploadFileUtils2;



@Controller
public class WriteArticleController {
	
	@Autowired
	private NoticeArticleService noticeArticleService;

	
	//게시글 쓰기 폼 요청 처리
	@RequestMapping(value="/writeNoticeArticle.do", method=RequestMethod.GET)
	public String form() {
		return "boardNav/noticleArticle/writeArticleForm";
	}
	
	
	
	//게시글 쓰기 요청 처리
	@RequestMapping(value="/writeNoticeArticle.do", method=RequestMethod.POST)
	public String submit(@ModelAttribute(value="notice") ArticleVO article, HttpServletRequest request) throws Exception {   //Command 객체
		
		//파일 업로드
		List<MultipartFile> files = article.getUpload();
		for(MultipartFile file : files) {
			if( !file.isEmpty() ) {
				ArticleFileVO ArticleFile = UploadFileUtils2.uploadFile(file, request);
				article.addArticleFile(ArticleFile);
			}
		}
		
		
		//이미지 파일 업로드
		MultipartFile files1 = article.getImgUpload();
		if( !files1.isEmpty() ) {
			ArticleImageVO ArticleImage = UploadFileUtils2.uploadFile1(files1, request);
			article.addArticleImage(ArticleImage);
		}
		
		noticeArticleService.registerArticle(article);	
		return "boardNavTest/noticleArticle/listArticle";
	}
	
	
}













