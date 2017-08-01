package com.project.groupware.controller.qnaArticle;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.ArticleReplyVO;
import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.service.QnAReplyService;
import com.project.groupware.service.QnAService;

@Controller
public class WriteQnAReplyController {
  
	@Autowired
	private QnAService qnaService;
	
	@Autowired
	private QnAReplyService qnaReplyService;
   		
   @RequestMapping(value="/writeQnAReply.do", method=RequestMethod.GET)
   public ModelAndView writeReply(@ModelAttribute(value="replyList") ArticleReplyVO articleReply,
		                          HttpSession session){
              
	   
	  //댓글등록
	  EmployeeVO employee = (EmployeeVO)session.getAttribute("employee");
	  String employeeId = employee.getId();
	  articleReply.setEmployeeId(employeeId); 
      qnaReplyService.registerQnAReply(articleReply);
      
      //댓글 리스트
      ModelAndView mv = new ModelAndView();
      mv.addObject("replyList", qnaReplyService.retrieveQnAReply(articleReply.getArticleId()));
      mv.setViewName("jsonView");
      return mv;
   }
   
}
















