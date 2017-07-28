package  com.project.groupware.controller.qnaArticle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.service.BoardService;
import com.project.groupware.service.QnAReplyService;
import com.project.groupware.service.QnAService;

@Controller
public class RemoveQnAController {

	@Autowired
	private QnAService qnaService;
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="/removeQnA.do", method=RequestMethod.GET)
	public String submit(@RequestParam(value="id")int id,
						  @RequestParam(value="boardId")int boardId){
		
		//게시글 삭제(1.파일삭제, 2.댓글 삭제, 3.게시글삭제)
		qnaService.removeQnA(id);
		
		 //메뉴 리스트
		boardService.retrieveBoardList();
				
		return "redirect:/listQnA.do?boardId=" + boardId;
	}
	
}
