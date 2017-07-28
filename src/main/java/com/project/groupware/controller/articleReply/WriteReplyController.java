/*package com.project.groupware.controller.articleReply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.groupware.domain.ArticleReplyVO;
import com.project.groupware.service.ArticleReplyService;
import com.project.groupware.service.ArticleService;

@Controller
public class WriteReplyController {
	@Autowired
	private ArticleReplyService articleReplyService;
	@Autowired
	private ArticleService articleService;
	
	//댓글 등록 요청을 처리할 컨트롤러 메소드
	@RequestMapping(value="writeReply.do", method=RequestMethod.GET)
	public String writeReply(@ModelAttribute(value="articleReply")
							 ArticleReplyVO articleReply, Model model) {
		//댓글 등록
		articleReplyService.registerReply(articleReply);
		
		//댓글 목록조회
		model.addAttribute("replyList",articleService.retrieveArticle(articleReply.getArticleId()).getReplys());
		return "jsonView";
	}
	
}
 */