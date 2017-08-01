package com.project.groupware.controller.articleReply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.ArticleReplyVO;
import com.project.groupware.service.ArticleReplyService;
import com.project.groupware.service.ArticleService;

@Controller
public class ModifyArticleReplyController {

	@Autowired
	private ArticleReplyService articleReplyService;
	@Autowired
	private ArticleService articleService;

	@RequestMapping(value = "/modifyReply.do", method = RequestMethod.GET)
	/*
	 * public String modifyReply(@ModelAttribute(value="articleReply")
	 * ArticleReplyVO articleReply, Model model) {
	 * 
	 * //댓글 수정
	 * 
	 * articleReplyService.modifyReply(articleReply);
	 * 
	 * //댓글 목록조회 model.addAttribute("listReply",articleService.retrieveArticle(
	 * articleReply.getArticleId()).getReplys()); return "jsonView";
	 */

	public ModelAndView modifyReply(@RequestParam(value = "replyId") String replyId,
									@RequestParam(value = "articleId") String articleId,
									@RequestParam(value = "content") String content) {

		ArticleReplyVO articleReply = new ArticleReplyVO();

		// 댓글수정
		articleReply.setId(Integer.parseInt(replyId));
		articleReply.setArticleId(Integer.parseInt(articleId));
		articleReply.setContent(content);
		articleReplyService.modifyReply(articleReply);

		// 댓글리스트출력
		ModelAndView mv = new ModelAndView();
		mv.addObject("listReply", articleReplyService.retrieveReply(articleReply.getArticleId()));
		mv.setViewName("jsonView");
		return mv;
	}
}
