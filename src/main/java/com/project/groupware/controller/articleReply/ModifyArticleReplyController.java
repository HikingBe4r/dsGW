/*package com.project.groupware.controller.articleReply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.groupware.domain.ArticleReplyVO;
import com.project.groupware.service.ArticleReplyService;
import com.project.groupware.service.ArticleService;

@Controller
public class ModifyArticleReplyController {

	@Autowired
	private ArticleReplyService articleReplyService;
	@Autowired
	private ArticleService articleService;
	
	@RequestMapping(value="/modifyReply.do",method=RequestMethod.GET)
	public String modifyReply(@ModelAttribute(value="articleReply")
							  ArticleReplyVO articleReply, Model model) {
		
		//댓글 수정
		articleReplyService.modifyReply(articleReply);
		
		//댓글 목록조회
		model.addAttribute("replyList",articleService.retrieveArticle(articleReply.getArticleId()).getReplys());
		return "jsonView";
	}
}
*/