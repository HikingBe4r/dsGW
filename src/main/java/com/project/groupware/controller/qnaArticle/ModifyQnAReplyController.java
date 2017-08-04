package com.project.groupware.controller.qnaArticle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.ArticleReplyVO;
import com.project.groupware.service.QnAReplyService;

@Controller
public class ModifyQnAReplyController {

	@Autowired
	private QnAReplyService qnaReplyService;
	
	@RequestMapping(value="/modifyQnAReply.do", method=RequestMethod.GET)
	public ModelAndView modifyReply(@RequestParam(value="replyId") String replyId,
									@RequestParam(value="articleId")String articleId,
									@RequestParam(value="content")String content){
		
		ArticleReplyVO articleReply = new ArticleReplyVO();
	
		//댓글수정
		articleReply.setId(Integer.parseInt(replyId));
		articleReply.setArticleId(Integer.parseInt(articleId));
		articleReply.setContent(content);
		qnaReplyService.modifyQnAReply(articleReply);
		
		//댓글리스트출력
		ModelAndView mv = new ModelAndView();
		mv.addObject("replyList", qnaReplyService.retrieveQnAReply(articleReply.getArticleId()));
		mv.setViewName("jsonView");
		return mv;
		
	}
	
}
