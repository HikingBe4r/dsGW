package com.project.groupware.controller.form;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.service.FormService;

@Controller
public class RemoveFormController {
	
	@Autowired
	private FormService formService;
	
	@RequestMapping(value="/removeForm.do", method=RequestMethod.GET)
	public ModelAndView removeForm(@RequestParam(value="formId", required=true) String formId) {
		ModelAndView mv = new ModelAndView();
		
		
		if(formService.removeForm(formId)) {
			// true이면
			mv.setViewName("redirect:/listForm.do?boardId=1");
		} else {
			mv.setViewName("adminNav/form/removeFormFail");
		}
		
		return mv;
	}
}
