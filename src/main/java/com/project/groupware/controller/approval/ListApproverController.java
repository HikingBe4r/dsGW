package com.project.groupware.controller.approval;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.service.DocumentService;

@Controller
public class ListApproverController {

	@Autowired
	private DocumentService documentService;
	
	@RequestMapping(value="/listApprover.do", method=RequestMethod.GET)
	public ModelAndView form(@RequestParam(value="documentId", required=true) String documentId) {
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("documentId", documentId);
		
		List<Map<String, Object>> approverList = documentService.retrieveApproverListDetailDocument(map);
				
		mv.addObject("approverList", approverList);		
		mv.setViewName("approval/listApprover");
		
		return mv; 		
	}
	
	@RequestMapping(value="/listApprover.do", method=RequestMethod.POST)
	public ModelAndView ajaxApproverList(
				@RequestParam(value="kind", required=true) String kind, // 1: 결재자, 2: 수신자
				@RequestParam(value="documentId", required=true) String documentId) {
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("documentId", documentId);
		map.put("kind", kind);
		
		List<Map<String, Object>> approverList = documentService.retrieveApproverListDetailDocument(map);
				
		mv.addObject("approverList", approverList);		
		mv.setViewName("jsonView");
		
		return mv; 		
	}
	
}
