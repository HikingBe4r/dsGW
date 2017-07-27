package com.project.groupware.controller.qnaArticle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.service.QnAReplyService;
import com.project.groupware.service.QnAService;

@Controller
public class RemoveQnAReplyController {

	@Autowired
	private QnAService qnaService;
	@Autowired
	private QnAReplyService qnaReplyService;
	
	@RequestMapping(value="/removeReply", method=RequestMethod.GET)
	public ModelAndView removeReply(@RequestParam(value="replyId") String replyId,
									@RequestParam(value="articleId")String articleId){
					
		//댓글 삭제
		
		qnaReplyService.removeReply(Integer.parseInt(replyId));
		
		//리스트 출력
		ModelAndView mv = new ModelAndView();
		mv.addObject("replyList", qnaService.retrieveArticle(Integer.parseInt(articleId)).getReplys());
		mv.setViewName("jsonView");
		return mv;
	}
	
}
