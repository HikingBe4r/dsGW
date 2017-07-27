/*package  com.project.groupware.controller.qnAaritlce;

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
public class ModifyQnAReplyController {

	@Autowired
	private QnAService qnaService;
	
	@Autowired
	private QnAReplyService qnaReplyService;
	
	@RequestMapping(value="/modifyReply.do", method=RequestMethod.GET)
	public ModelAndView modifyReply(@RequestParam(value="replyId") String replyId,
									@RequestParam(value="articleId")String articleId,
									@RequestParam(value="content")String content){
		
		ArticleReplyVO articleReply = new ArticleReplyVO();
		
	
		//댓글수정
		articleReply.setId(Integer.parseInt(replyId));
		articleReply.setArticleId(Integer.parseInt(articleId));
		articleReply.setContent(content);
		qnaReplyService.modifyReply(articleReply);
		
		//댓글리스트출력
		ModelAndView mv = new ModelAndView();
		mv.addObject("replyList", qnaService.retrieveArticle(articleReply.getArticleId()).getReplys());
		mv.setViewName("jsonView");
		return mv;
		
	}
	
}
*/