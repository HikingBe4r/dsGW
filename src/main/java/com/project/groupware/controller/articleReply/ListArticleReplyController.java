/*package com.project.groupware.controller.articleReply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.service.ArticleReplyService;

@Controller
public class ListArticleReplyController {

	@Autowired
	private ArticleReplyService articleReplyService;
	
	@RequestMapping(value="/listReply.do", method=RequestMethod.GET)
	public ModelAndView detailArticle(@RequestParam(value="articleId")int articleId){
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("replys", articleReplyService.retrieveReply(articleId));
		mv.setViewName("jsonView");
		return mv;
		
	}
}
*/