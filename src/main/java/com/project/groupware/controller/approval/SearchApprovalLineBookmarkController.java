package com.project.groupware.controller.approval;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.service.DocumentService;

@Controller
public class SearchApprovalLineBookmarkController {
	
	@Autowired
	private DocumentService documentService;
	
	@RequestMapping(value="/searchApprovalLineBookmark.do", method=RequestMethod.GET)
	public ModelAndView searchApprovalLineBookmark(@RequestParam(value="employeeId") String employeeId,
											 @RequestParam(value="keyword") String keyword) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("employeeId", employeeId);
		map.put("keyword", keyword);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("approvalLineList", documentService.retrieveApprovalLineList(map));
		mv.setViewName("jsonView");
		
		return mv;
	}

}
