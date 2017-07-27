package com.project.groupware.controller.qnaArticle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.ArticleVO;
import com.project.groupware.service.BoardService;
import com.project.groupware.service.QnAService;

@Controller
public class DetailQnAController {

	@Autowired
	private QnAService qnaService;
	
	@Autowired
	private BoardService boardService;

	@RequestMapping(value="/detailQnA.do", method=RequestMethod.GET)
	public ModelAndView datailArticle(@RequestParam(value="id", required=true)int id){
		
		qnaService.upHitcount(id);
		
		ArticleVO article = qnaService.retrieveArticle(id);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("article", article);
		mv.addObject("boards",boardService.retrieveBoardList());
		mv.setViewName("boardNavTest/qna/detailQnA");
		
		return mv;
	}
	
}
