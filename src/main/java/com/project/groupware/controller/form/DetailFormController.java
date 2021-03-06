package com.project.groupware.controller.form;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.service.FormService;

@Controller
public class DetailFormController {
	
	@Autowired
	private FormService formService;
	
	@RequestMapping(value="/detailForm.do", method=RequestMethod.GET)
	public ModelAndView detailForm(
			@RequestParam(value="formId", required=true) String formId,
			HttpSession session
			) {
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("form", formService.retrieveForm(formId));
		
		if(session.getAttribute("employee") != null) {
			mv.setViewName("approvalNav/form/detailForm");
		} else {
			mv.setViewName("adminNav/form/detailForm");
		}
		
		return mv;		
	}
}
