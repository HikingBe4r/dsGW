package com.project.groupware.controller.document;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.service.DocumentService;

@Controller
public class ListDocumentController {
	
	@Autowired
	private DocumentService DocumentService;	
	
	@RequestMapping(value="/listAcceptDocument.do", method=RequestMethod.GET)
	public ModelAndView listAcceptDocument() {
		
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int status = 3;
		
		map.put("status", status);
		
		mv.addObject("status", status);
		mv.addObject("documentList", DocumentService.retrieveDocumentList(map));
		mv.setViewName("approvalNav/document/listAcceptDocument");
		
		return mv;
		
	}	
	
}