package com.project.groupware.controller.approval;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TestController {
	
	
	@RequestMapping(value="/board.do", method=RequestMethod.GET)
	public String board() {
		return "boardNav/board/board"; 
		
	}
	
	@RequestMapping(value="/boardManager.do", method=RequestMethod.GET)
	public String boardManager() {
		return "boardNav/board/boardManager"; 
		
	}
	
	
}
