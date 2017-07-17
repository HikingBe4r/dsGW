package com.project.groupware.controller.document;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.service.FormService;

@Controller
public class ChoiceFormController {

	@Autowired
	private FormService formService;
	
	
	@RequestMapping(value="/choiceForm.do", method=RequestMethod.GET)
	public ModelAndView choiceForm(@RequestParam(value="keyword", required=false) String keyword ) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("formList", formService.retrieveFormList(keyword));
		mv.setViewName("approvalNav/document/choiceForm");
		
		return mv;
	}
	
	
	
	
}
