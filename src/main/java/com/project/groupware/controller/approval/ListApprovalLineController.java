package com.project.groupware.controller.approval;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.groupware.service.DocumentService;

@Controller
public class ListApprovalLineController {

	private DocumentService documentService;
	
	@RequestMapping(value="/listApprovalLine.do", method=RequestMethod.GET)
	public String listApprovalLine() {
		return ""; 		
	}
	
	
}
