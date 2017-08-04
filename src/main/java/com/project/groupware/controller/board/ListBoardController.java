package com.project.groupware.controller.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.service.BoardService;

@Controller
public class ListBoardController {

	@Autowired
	private BoardService boardService;
	

	//게시판 리스트 보여주기
	@RequestMapping(value="/listBoard.do", method=RequestMethod.GET)
	public ModelAndView listBoard() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("boards",boardService.retrieveBoardList());
		mv.setViewName("redirect:/listNoticeArticleForm.do?boardId=311&secret=1");
		return mv;
	}
	
}
