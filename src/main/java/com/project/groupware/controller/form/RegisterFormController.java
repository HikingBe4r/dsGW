package com.project.groupware.controller.form;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.groupware.domain.FormVO;
import com.project.groupware.service.FormService;

@Controller
public class RegisterFormController {
	
	@Autowired
	private FormService formService;
	
	
	@RequestMapping(value="/registerForm.do", method=RequestMethod.GET)
	public String form() {
		return "approvalNav/form/registerForm";
	}
	
	@RequestMapping(value="/registerForm.do", method=RequestMethod.POST)
	public String submit(@ModelAttribute(value="formVO") FormVO formVO) {
		System.out.println("formVO: "+formVO);
		//formService.registerForm(formVO);
		
		return "approvalNav/form/registerFormSuccess";
	}
}
