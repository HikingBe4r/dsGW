package com.project.groupware.controller.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;



import com.project.groupware.service.BoardService;

@Controller
public class RemoveBoardController {

	@Autowired
	private BoardService boardService;
	
	//게시판을 제거하는 컨트롤러
	@RequestMapping(value="/removeBoard.do" , method=RequestMethod.GET) 
	public String submit(@RequestParam(value="id")int id
						,Model model) {
		
		
		//게시판에 있는 게시글수
		int count = boardService.articleCount(id);
		
		if(count == 0 ) {
			//게시판 삭제
			boardService.removeBoard(id); 
			//게시판 목록조회
			model.addAttribute("isRemoved", 0);
			model.addAttribute("boardList",boardService.retrieveBoardList());		
			return "jsonView";
		}
		
		else{
			model.addAttribute("isRemoved", 1);
			model.addAttribute("boardList",boardService.retrieveBoardList());			
			return "jsonView";
		}
		

	} 
}
