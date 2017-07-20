package com.project.groupware.controller.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.ApprovalLineVO;
import com.project.groupware.service.DocumentService;

@Controller
public class ListApprovalLineBookmarkController {
	
	@Autowired
	private DocumentService documentService;

	@RequestMapping(value="/listApprovalLineBookmark.do", method=RequestMethod.POST)
	public ModelAndView listApprovalLineBookmark(@RequestParam(value="employeeId", required=true) String employeeId) {
		
		ModelAndView mv = new ModelAndView();
		List<ApprovalLineVO> approvalLineList = documentService.retrieveApprovalLineList(employeeId);
		mv.addObject("approvalLineList", approvalLineList);
		mv.setViewName("jsonView");		
		return mv; 		
	}
}
