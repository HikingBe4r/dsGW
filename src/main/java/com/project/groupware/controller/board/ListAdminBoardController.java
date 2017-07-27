package com.project.groupware.controller.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.service.BoardService;

@Controller
public class ListAdminBoardController {

	@Autowired
	private BoardService boardService;
	

	//관리자게시판 리스트 보여주기
	@RequestMapping(value="/listAdmin.do", method=RequestMethod.GET)
	public ModelAndView listAdmin() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("boards",boardService.retrieveBoardList());
		mv.setViewName("boardNavTest/board/listAdmin");
		return mv;
	}
	
}
