package com.project.groupware.controller.form;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.service.FormService;

@Controller
public class ListFormController {
	
	@Autowired
	private FormService formService;
	
	@RequestMapping(value="/listForm.do", method=RequestMethod.GET)
	public ModelAndView listForm(@RequestParam(value="keyword", required=false) String keyword /*@RequestAttribute(value="keyword", required=false) String keyword*/) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		//String keyword = (String) request.getAttribute("keyword");
		
		mv.addObject("formList", formService.retrieveFormList(keyword));
		mv.setViewName("approvalNav/form/listForm");
		
		return mv;
	}
}
