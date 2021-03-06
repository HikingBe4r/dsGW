package com.project.groupware.controller.qnaArticle;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.ArticleVO;
import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.service.BoardService;
import com.project.groupware.service.QnAService;

@Controller
public class DetailQnAController {

	@Autowired
	private QnAService qnaService;
	
	@Autowired
	private BoardService boardService;

	@RequestMapping(value="/detailQnA.do", method=RequestMethod.GET)
	public ModelAndView datailArticle(@SessionAttribute(value="employee") EmployeeVO employee,
									@RequestParam(value="id", required=true)String id,
									  @RequestParam(value="off", required=true, defaultValue="0")int off
									  /*@RequestParam(value="boardId")int boardId*/){
		
		qnaService.upHitcountQnA(Integer.parseInt(id));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("off", off);
		map.put("employeeId", employee.getId());
		
		ArticleVO article = qnaService.retrieveQnA(map);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("article", article);
		mv.addObject("boards",boardService.retrieveBoardList());
		/*mv.addObject("boardId", boardId);*/
		mv.setViewName("boardNavTest/qna/detailQnA");
		
		return mv;
	}
	
}
