package com.project.groupware.controller.form;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.FormVO;
import com.project.groupware.service.FormService;

@Controller
public class ModifyFormController {
	
	@Autowired
	private FormService formService;
	
	
	@RequestMapping(value="/modifyForm.do", method=RequestMethod.GET)
	public ModelAndView form(@ModelAttribute(value="formVO") FormVO formVO) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("form", formVO);
		mv.setViewName("approvalNav/form/modifyForm");
		
		return mv;
	}
	
	@RequestMapping(value="/modifyForm.do", method=RequestMethod.POST)
	public ModelAndView submit(@ModelAttribute(value="formVO") FormVO formVO) {
		ModelAndView mv = new ModelAndView();
		
		formService.modifyForm(formVO);
		
		mv.addObject("form", formVO);
		mv.setViewName("approvalNav/form/detailForm");
		
		return mv;
	}
}
