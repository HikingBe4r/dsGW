package com.project.groupware.controller.approval;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TestController {
	
	@RequestMapping(value="/listForm.do", method=RequestMethod.GET)
	public String listForm() {
		return "approvalNav/form/listForm"; 		
	}
	
	@RequestMapping(value="/writeDocument.do", method=RequestMethod.GET)
	public String writeDocument() {
		return "approvalNav/document/writeDocument"; 		
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String loginForm() {
		return "login/loginForm"; 	
	}
	
	@RequestMapping(value="/findId.do", method=RequestMethod.GET)
	public String findId() {
		return "login/findEmployeeId"; 
	}
	
	
	@RequestMapping(value="/board.do", method=RequestMethod.GET)
	public String board() {
		return "boardNav/board/board"; 
		
	}
	
	@RequestMapping(value="/boardManager.do", method=RequestMethod.GET)
	public String boardManager() {
		return "boardNav/board/boardManager"; 
		
	}
	
	
}
