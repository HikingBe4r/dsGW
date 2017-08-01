package com.project.groupware.controller.qnaArticle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.ArticleReplyVO;
import com.project.groupware.service.QnAReplyService;
import com.project.groupware.service.QnAService;

@Controller
public class ListQnAReplyController {

	@Autowired
	private QnAService qnaService;
	
	@Autowired
	private QnAReplyService qnaReplyService;
	
	@RequestMapping(value="/listQnAReply.do", method=RequestMethod.GET)
	public ModelAndView removeReply(@RequestParam(value="articleReply") ArticleReplyVO articleReply){
		
		//QnA댓글 리스트
		ModelAndView mv = new ModelAndView();
		mv.addObject("replys", qnaReplyService.retrieveQnAReply(articleReply.getArticleId()));
		mv.setViewName("jsonView");
		return mv;
	}
	
}
