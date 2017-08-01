package com.project.groupware.controller.article;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.ArticleFileVO;
import com.project.groupware.domain.ArticleVO;
import com.project.groupware.domain.BoardVO;
import com.project.groupware.service.ArticleService;
import com.project.groupware.service.BoardService;
import com.project.groupware.util.UploadFileUtils;
import com.project.groupware.util.UploadFileUtils2;

@Controller
public class ModifyArticleController {

	@Autowired
	private ArticleService articleService;
	@Autowired
	private BoardService boardService;

	// 게시글 수정 폼 요청처리 컨트롤러
	@RequestMapping(value = "/modifyArticle.do", method = RequestMethod.GET)
	public ModelAndView form(@RequestParam(value = "id", required = true) int id) {
		

		List<BoardVO> boards = boardService.retrieveBoardList();
		ModelAndView mv = new ModelAndView();
		mv.addObject("boards", boards);
		mv.addObject("article", articleService.retrieveArticle(id));
		mv.setViewName("boardNavTest/article/modifyArticleForm");
		return mv;
		
	}

	// 게시글 수정 요청처리 컨트롤러
	@RequestMapping(value = "modifyArticle.do", method = RequestMethod.POST)
	public String submit(@ModelAttribute(value = "article") ArticleVO article, HttpServletRequest request, Model model)
			throws Exception {
	
		// 파일 등록
		List<MultipartFile> inputFiles = article.getUpload();
		for (MultipartFile file : inputFiles) {
			if (!file.isEmpty()) {
				ArticleFileVO articleFile = UploadFileUtils.uploadFile(file, request);
				article.addArticleFile(articleFile);
			}
		}

		// 파일 삭제
		List<ArticleFileVO> files = article.getFiles();
		File file = null;
		for (ArticleFileVO temp : files) {
			file = new File(UploadFileUtils.UPLOAD_PATH + File.separator + temp.getSystemFileName());
			if (file.exists()) {
				file.delete();
			}
		}

		model.addAttribute("boards", boardService.retrieveBoardList());

		articleService.modifyArticle(article);
		return "redirect:/detailArticle.do?id=" + article.getId();
	}
}
