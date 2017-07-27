package com.project.groupware.controller.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.groupware.domain.BoardVO;
import com.project.groupware.service.BoardService;

@Controller
public class WriteBoardController {
	
	@Autowired
	private BoardService boardService;
	
	//게시판 등록 요청을 처리한 컨트롤러
	@RequestMapping(value="writeBoard.do" , method=RequestMethod.GET)
	public String wrtiteBoard(@ModelAttribute(value="board") BoardVO board, Model model) {
		
		//게시판 등록
		boardService.registerBoard(board);
		
		//게시판 목록조회
		model.addAttribute("boardList",boardService.retrieveBoardList());
		return "jsonView";
		
	}
}
