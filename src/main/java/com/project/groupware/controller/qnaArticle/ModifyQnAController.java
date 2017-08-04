package com.project.groupware.controller.qnaArticle;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.project.groupware.service.BoardService;
import com.project.groupware.service.QnAService;
import com.project.groupware.util.UploadFileUtils;
import com.project.groupware.util.UploadFileUtils2;

@Controller
public class ModifyQnAController {

	@Autowired
	private QnAService qnaService;
	@Autowired
	private BoardService boardService;

	// 게시글 수정 폼 요청처리 컨트롤러
	@RequestMapping(value = "/modifyQnAForm.do", method = RequestMethod.GET)
	public ModelAndView form(/*@SessionAttribute(value="employee") EmployeeVO employee,*/
							@RequestParam(value="id", required=true)int id,
							@RequestParam(value="off", required=true, defaultValue="0")int off, HttpServletRequest request)	throws Exception {

		List<BoardVO> boards = boardService.retrieveBoardList();
		ModelAndView mv = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("off", off);
		/*map.put("employeeId", employee.getId());*/
		
		mv.addObject("boards", boards);
		mv.addObject("article", qnaService.retrieveQnA(map));
		mv.setViewName("boardNavTest/qna/modifyQnA");
		return mv;
	}

	// 게시글 수정 요청처리 컨트롤러
	@RequestMapping(value = "modifyQnA.do", method = RequestMethod.POST)
	public String submit(@ModelAttribute(value = "article") ArticleVO article,
						HttpServletRequest request, Model model)	throws Exception {
		//
	
		// 파일 등록
		List<MultipartFile> inputFiles = article.getUpload();
		for (MultipartFile file : inputFiles) {
			if (!file.isEmpty()) {
				ArticleFileVO articleFile = UploadFileUtils2.uploadFile(file, request);
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
		qnaService.modifyQnA(article);
		
		return "redirect:/detailQnA.do?id=" + article.getId();
	}
}