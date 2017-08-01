package com.project.groupware.controller.article;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.BoardVO;
import com.project.groupware.service.ArticleService;
import com.project.groupware.service.BoardService;

@Controller
public class DetailArticleController {
	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private BoardService boardService;
	
	//게시글 상세조회 요청처리 컨트롤러
	@RequestMapping(value="/detailArticle.do" , method=RequestMethod.GET)
	public ModelAndView detailArticle(@RequestParam(value="id", required=true)int id){
									  
		articleService.upHitcount(id);
		
		List<BoardVO> boards = boardService.retrieveBoardList();
		
		ModelAndView mv = new ModelAndView();	
		mv.addObject("boards",boards);
		mv.addObject("article", articleService.retrieveArticle(id));
		mv.setViewName("boardNavTest/article/detailArticle");
		return mv;
		
		
	} 

}
