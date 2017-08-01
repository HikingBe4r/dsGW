package com.project.groupware.controller.qnaArticle;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.ArticleFileVO;
import com.project.groupware.domain.ArticleVO;
import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.service.BoardService;
import com.project.groupware.service.DepartmentService;
import com.project.groupware.service.QnAService;
import com.project.groupware.util.UploadFileUtils;

@Controller
public class WriteQnAController {

	@Autowired
	private QnAService qnaService;

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private DepartmentService departmentService;

	// 게시글 등록 폼
	@RequestMapping(value = "/writeQnA.do", method = RequestMethod.GET)
	public ModelAndView form() {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("boards", boardService.retrieveBoardList());
		mv.setViewName("boardNavTest/qna/writeQnA");
		return mv;
	}

	// 게시글 등록
	@RequestMapping(value = "/writeQnA.do", method = RequestMethod.POST)
	public String submit(@SessionAttribute(value = "employee") EmployeeVO employee,
						@ModelAttribute(value = "article") ArticleVO article,
						@RequestParam(value="secret", required=false, defaultValue="1") String secret,
						HttpServletRequest request, Model model)
			throws Exception {
	
			
	      article.setEmployeeId(employee.getId());
	      //파일 업로드
	      List<MultipartFile> files = article.getUpload();

			for (MultipartFile file : files) {
				if (!file.isEmpty()) {
					ArticleFileVO articleFile = UploadFileUtils.uploadFile(file, request);
					article.addArticleFile(articleFile);

				}
			}
		
		model.addAttribute("boards", boardService.retrieveBoardList());
		model.addAttribute("departments", departmentService.retrieveDepartmentListID());
		
			
		qnaService.registerQnA(article);

		return "redirect:/listQnAForm.do?boardId="+ article.getBoardId()+"&secret="  + secret ;
	}
}