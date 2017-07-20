package com.project.groupware.controller.approval;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.ApproverVO;
import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.service.DocumentService;
import com.project.groupware.service.EmployeeService;

@Controller
public class ListApproverInBookmarkController {
	
	@Autowired
	private DocumentService documentService;
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value="/listApproverInBookmark.do", method=RequestMethod.POST)
	public ModelAndView listApprover(@RequestParam(value="approvalLineId") String approvalLineId) {
		
		ModelAndView mv = new ModelAndView();
		List<ApproverVO> list = documentService.retrieveApproverList(approvalLineId);
		List<EmployeeVO> approverList = new ArrayList<EmployeeVO>();
		List<EmployeeVO> recieverList = new ArrayList<EmployeeVO>();
		
		for(int i=0; i<list.size(); i++) {
			ApproverVO approver = list.get(i);
			if(approver.getStep() == 0) {
				recieverList.add(employeeService.retrieveEmployeeDetail(approver.getEmployeeId()));
			} else if(approver.getStep() > 1) {
				approverList.add(employeeService.retrieveEmployeeDetail(approver.getEmployeeId()));
			}
		}
		
		mv.addObject("approverList", approverList);
		mv.addObject("recieverList", recieverList);
		mv.setViewName("jsonView");
		
		return mv;
	}

}
