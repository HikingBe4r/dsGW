package com.project.groupware.controller.approval;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.groupware.service.DocumentService;

@Controller
public class ListApproverController {

	private DocumentService documentService;
	
	@RequestMapping(value="/listApprover.do", method=RequestMethod.GET)
	public String listApprover() {
		return ""; 		
	}
	
	
}
