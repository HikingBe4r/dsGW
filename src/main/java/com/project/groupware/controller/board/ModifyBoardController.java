package com.project.groupware.controller.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.groupware.domain.BoardVO;
import com.project.groupware.service.BoardService;

@Controller
public class ModifyBoardController {

	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="/modifyBoard.do" , method=RequestMethod.GET)
	public String submit(@ModelAttribute(value="board") BoardVO board , Model model) {
		
		//게시판 수정
		boardService.modifyBoard(board);
		
		//게시판 목록조회
		model.addAttribute("boardList",boardService.retrieveBoardList());
		return "jsonView";
		
	}
}