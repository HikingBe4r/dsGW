package com.project.groupware.controller.approval;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.groupware.service.DocumentService;

@Controller
public class ModifyApproverListController {

	@Autowired
	private DocumentService documentService;
	
	@RequestMapping(value="/modifyApproverList.do", method=RequestMethod.GET)
	public String modifyApproverList() {
		return ""; 
	}
	
}
