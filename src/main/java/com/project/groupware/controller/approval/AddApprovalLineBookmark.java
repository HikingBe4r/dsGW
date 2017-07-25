package com.project.groupware.controller.approval;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AddApprovalLineBookmark {
	
	@RequestMapping(value="/addApprovalLineBookmark.do", method=RequestMethod.GET)
	public String addApprovalLineBookmark() {	
		return "approvalNav/approval/addApprovalLineBookmark";
	}
	
}
