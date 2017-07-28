package com.project.groupware.controller.noticleArticle;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.ArticleVO;
import com.project.groupware.domain.BoardVO;
import com.project.groupware.service.BoardService;
import com.project.groupware.service.NoticeArticleService;

@Controller
public class DetailArticleController {
   @Autowired
   private NoticeArticleService noticearticleService;
   
   @Autowired
   private BoardService boardService;
   
   //게시글 상세조회
   @RequestMapping(value="/detailNoticeArticle.do" , method=RequestMethod.GET)
   public ModelAndView detailArticle(
		   @RequestParam(value="id", required=true)int id // 당사자. articleId
		
		 
		   ){
	  
	  noticearticleService.upHitcount(id);
      List<BoardVO> boards = boardService.retrieveBoardList();
      
      ModelAndView mv = new ModelAndView();   
      mv.addObject("boards",boards);
      mv.addObject("article", noticearticleService.retrieveArticle(id));
      
            
  
      
      mv.setViewName("boardNavTest/noticleArticle/detailArticle");
      return mv;
      
      
   } 

   
   
}