package com.project.groupware.controller.form;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.groupware.service.FormService;

@Controller
public class RegisterBookmarkFormController {
	
	@Autowired
	private FormService formService;
	
	@RequestMapping(value="registerBookmarkForm.do", method=RequestMethod.GET)
	public String form() {
		return null;
	}
}
