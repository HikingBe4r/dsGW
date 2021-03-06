package com.project.groupware.controller.article;

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
import com.project.groupware.domain.BoardVO;
import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.service.ArticleService;
import com.project.groupware.service.BoardService;
import com.project.groupware.service.DepartmentService;
import com.project.groupware.util.UploadFileUtils;

@Controller
public class WriteArticleController {

	@Autowired
	private ArticleService articleService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private DepartmentService departmentService;

	// 게시글 폼 요청처리
	@RequestMapping(value = "/writeArticle.do", method = RequestMethod.GET)
	public ModelAndView form() {
		
		List<BoardVO> boards = boardService.retrieveBoardList();

		ModelAndView mv = new ModelAndView();

		mv.addObject("boards", boards);

		mv.setViewName("boardNavTest/article/writeArticleForm");
		return mv;
	}

	// 게시글 쓰기 요청처리
	@RequestMapping(value = "/writeArticle.do", method = RequestMethod.POST)
	public String submit(@SessionAttribute(value = "employee") EmployeeVO employee,
			@ModelAttribute(value = "article") ArticleVO article,
			@RequestParam(value="secret", required=false, defaultValue="0") String secret,HttpServletRequest request, Model model)
			throws Exception {
		
		article.setEmployeeId(employee.getId());

		List<MultipartFile> files = article.getUpload();

		for (MultipartFile file : files) {
			if (!file.isEmpty()) {
				ArticleFileVO articleFile = UploadFileUtils.uploadFile(file, request);
				article.addArticleFile(articleFile);

			}
		}

		model.addAttribute("boards", boardService.retrieveBoardList());
		model.addAttribute("departments", departmentService.retrieveDepartmentListID());

		articleService.registerArticle(article);
		return "redirect:/listArticleForm.do?boardId="+ article.getBoardId()+"&secret="  + secret;
	}
}
