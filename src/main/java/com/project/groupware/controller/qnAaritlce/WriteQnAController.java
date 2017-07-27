/*package com.project.groupware.controller.qnAaritlce;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.ArticleVO;
import com.project.groupware.service.BoardService;
import com.project.groupware.service.QnAService;

@Controller
public class WriteQnAController {

	@Autowired
	private QnAService qnaService;

	@Autowired
	private BoardService boardService;

	// 게시글 등록 폼
	@RequestMapping(value = "/writeArticle.do", method = RequestMethod.GET)
	public ModelAndView form() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("board", boardService.retrieveBoardList());
		mv.setViewName("boardNavTest/qna/writeArticle");
		return mv;
	}

	// 게시글 등록
	@RequestMapping(value = "/writeArticle.do", method = RequestMethod.POST)
	public String submit(@ModelAttribute(value = "article") ArticleVO article, HttpServletRequest request)
			throws Exception {
		return null;

		// 파일업로드
		List<MultipartFile> files = article.getUpload();
		for (MultipartFile file : files) {
			if (!file.isEmpty()) {
				ArticleFileVO articleFile = UploadFileUtils2.uploadFile(file, request);
				article.addArticleFile(articleFile);
			}
		}
		qnaService.registerArticle(article);

		return "redirect:/listArticle.do?boardId=" + article.getBoardId();
	}
}*/