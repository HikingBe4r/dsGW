package com.project.groupware.controller.approval;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.groupware.domain.ApproverVO;
import com.project.groupware.service.DocumentService;

@Controller
public class RemoveApprovalLineBookmarkController {
	
	@Autowired
	private DocumentService documentService;
	
	@RequestMapping(value="/removeApprovalLineBookmark.do", method=RequestMethod.GET)
	public String form() {	
		return "approvalNav/approval/removeApprovalLineBookmark";
	}
	
	@RequestMapping(value="/removeApprovalLineBookmark.do", method=RequestMethod.POST)
	public String submit(@RequestParam(value="approvalLineId") String approvalLineId) {		
		documentService.removeApprovalLine(approvalLineId);		
		return "jsonView";
	}

}