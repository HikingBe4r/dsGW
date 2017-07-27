package com.project.groupware.controller.articleReply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.ArticleReplyVO;
import com.project.groupware.service.ArticleReplyService;
import com.project.groupware.service.ArticleService;

@Controller
public class RemoveArticleReplyController {
	@Autowired
	private ArticleService articleService;
	@Autowired
	private ArticleReplyService articleReplyService;
	
	
	
	//댓글 삭제
	@RequestMapping(value="/removeReply.do", method=RequestMethod.GET)
	public String submit(/*@ModelAttribute(value="articleReply")
								ArticleReplyVO articleReply,*/
								@RequestParam(value="articleId")int articleId,
								@RequestParam(value="id")int id,
								Model model) {
		
		//댓글 삭제
		articleReplyService.removeReply(id);
		
		
		
		//댓글 목록조회
		model.addAttribute("replyList",articleReplyService.retrieveReply(articleId));
		
		return "jsonView";
	}
}
