package com.project.groupware.controller.noticleArticle;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.ArticleVO;
import com.project.groupware.service.BoardService;
import com.project.groupware.service.NoticeArticleService;

@Controller
public class NaviNoticeArticleController {
	@Autowired
	private NoticeArticleService noticleArticleService;
	@Autowired
	private BoardService boardService;


	@RequestMapping(value="/naviDetailNoticeArticle.do", method=RequestMethod.GET)
	public ModelAndView submit(@RequestParam(value="id", required=true) int id, 
			            @RequestParam(value="navi", required=true) String navi,
			            @RequestParam(value = "boardId") int boardId,
			            Model model){
			
		System.out.println("boardddddddddddd" + boardId);
			ModelAndView mv = new ModelAndView();
	      
			Map<String, Object> map = new HashMap<String, Object>();
			
			
			ArticleVO article = null;
			if(navi.equals("prev")) {
				map.put("id",id);
				map.put("boardId",boardId);
				
				article= noticleArticleService.prevArticle(map);		
				if(article == null) {
					article = noticleArticleService.retrieveArticle(id);
				}
				
			} else if(navi.equals("next")){
				map.put("id",id);
				map.put("boardId",boardId);
				
				article = noticleArticleService.nextArticle(map);						
				if(article == null) {
					article = noticleArticleService.retrieveArticle(id);
				}
			}
			
			mv.addObject("article", article);			
			mv.addObject("boards", boardService.retrieveBoardList());
		    
			mv.setViewName("boardNavTest/noticleArticle/detailArticle");		
			
			return mv;			
	}
}


