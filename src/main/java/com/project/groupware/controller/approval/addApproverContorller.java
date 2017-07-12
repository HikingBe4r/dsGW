package com.project.groupware.controller.approval;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class addApproverContorller {
	
	@RequestMapping(value="/addApprover.do", method=RequestMethod.GET)
	public String addApprover() {
		return "approvalNav/approval/addApprover"; 		
	}
	
	
}
