package com.project.groupware.controller.articleReply;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.ArticleReplyVO;
import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.service.ArticleReplyService;
import com.project.groupware.service.ArticleService;

@Controller
public class WriteReplyController {
	@Autowired
	private ArticleReplyService articleReplyService;
	@Autowired
	private ArticleService articleService;

	// 댓글 등록 요청을 처리할 컨트롤러 메소드
	@RequestMapping(value="writeReply.do", method=RequestMethod.GET)
/*	public String writeReply(@ModelAttribute(value="articleReply")
							 ArticleReplyVO articleReply, Model model) {
		//댓글 등록
		articleReplyService.registerReply(articleReply);
		
		//댓글 목록조회
		model.addAttribute("listReply",articleService.retrieveArticle(articleReply.getArticleId()).getReplys());
		return "jsonView";*/
	 
	public ModelAndView writeReply(@ModelAttribute(value="articleReply") ArticleReplyVO articleReply,
									HttpSession session){
        
		   
		//댓글등록
		EmployeeVO employee = (EmployeeVO)session.getAttribute("employee");
		String employeeId = employee.getId();
		articleReply.setEmployeeId(employeeId); 
		articleReplyService.registerReply(articleReply);

		//댓글 리스트
		ModelAndView mv = new ModelAndView();
		mv.addObject("listReply", articleReplyService.retrieveReply(articleReply.getArticleId()));
		mv.setViewName("jsonView");
		return mv;
	}
}
