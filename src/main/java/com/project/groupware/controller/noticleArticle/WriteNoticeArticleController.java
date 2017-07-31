/*package com.project.groupware.controller.noticleArticle;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.ArticleFileVO;
import com.project.groupware.domain.ArticleImageVO;
import com.project.groupware.domain.ArticleVO;
import com.project.groupware.domain.BoardVO;
import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.service.BoardService;
import com.project.groupware.service.DepartmentService;
import com.project.groupware.service.NoticeArticleService;
import com.project.groupware.util.UploadFileUtils;



@Controller
public class WriteNoticeArticleController {
	
	@Autowired
	private NoticeArticleService noticeArticleService;

	@Autowired
	private BoardService boardService;

	@Autowired
	private DepartmentService departmentService;
	
	//게시글 쓰기 폼 요청 처리
	@RequestMapping(value="/writeNoticeArticle.do", method=RequestMethod.GET)
	public ModelAndView form() {
		List<BoardVO> boards = boardService.retrieveBoardList();
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("boards", boards);
		mv.setViewName("boardNav/noticleArticle/writeArticleForm");
		return mv;
	}
	
	
	
	//게시글 쓰기 요청 처리
	@RequestMapping(value="/writeNoticeArticle.do", method=RequestMethod.POST)
	public String submit(@SessionAttribute(value = "employee") EmployeeVO employee,
			@ModelAttribute(value = "article") ArticleVO article, HttpServletRequest request, Model model)
			throws Exception {
		
		article.setEmployeeId(employee.getId());
		//파일 업로드
		List<MultipartFile> files = article.getUpload();
		for(MultipartFile file : files) {
			if( !file.isEmpty() ) {
				ArticleFileVO ArticleFile = UploadFileUtils.uploadFile(file, request);
				article.addArticleFile(ArticleFile);
			}
		}
		
		
		//이미지 파일 업로드
		MultipartFile files1 = article.getImgUpload();
		if( !files1.isEmpty() ) {
			ArticleImageVO ArticleImage = UploadFileUtils.uploadFile1(files1, request);
			article.addArticleImage(ArticleImage);
		}
		
		model.addAttribute("boards", boardService.retrieveBoardList());
		model.addAttribute("departments", departmentService.retrieveDepartmentListID());

		
		noticeArticleService.registerNoticeArticle(article);	
		return "boardNavTest/noticleArticle/listArticle";
	}
	
	
}













*/