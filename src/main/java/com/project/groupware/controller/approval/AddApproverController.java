package com.project.groupware.controller.approval;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.groupware.domain.ApproverVO;
import com.project.groupware.service.DocumentService;

@Controller
public class AddApproverController {
	
	@Autowired
	private DocumentService documentService;
	
	
	@RequestMapping(value="/addApprover.do", method=RequestMethod.GET)
	public String form() {
		return "approvalNav/approval/addApprover"; 		
	}
	
	
	@RequestMapping(value="/addApprover.do", method=RequestMethod.POST)
	public String submit(@ModelAttribute(value="approver") ApproverVO approver) {
		
		/*
		 * 
		 *  결재자 추가ㅏㅏㅏ
		 * 
		 * 
		 */
		
		return "approvalNav/approval/addApprover"; 		
	}

}
