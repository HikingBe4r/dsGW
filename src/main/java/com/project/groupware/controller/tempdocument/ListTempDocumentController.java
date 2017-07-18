package com.project.groupware.controller.tempdocument;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.service.TempDocumentService;

@Controller
public class ListTempDocumentController {
	
	@Autowired
	private TempDocumentService tempDocumentService;	
	
	@RequestMapping(value="/listTempDocument.do", method=RequestMethod.GET)
	public ModelAndView listTempDocument() {
		
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int employeeId = 1;
		
		map.put("employeeId", employeeId);
		
		mv.addObject("tempDocumentList", tempDocumentService.retrieveTempDocumentList(map));
		mv.setViewName("approvalNav/document/listTempDocument");
		
		return mv;
	}
	
}