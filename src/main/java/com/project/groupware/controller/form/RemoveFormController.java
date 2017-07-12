package com.project.groupware.controller.form;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.groupware.service.FormService;

@Controller
public class RemoveFormController {
	
	@Autowired
	private FormService formService;
	
	@RequestMapping(value="/removeForm.do", method=RequestMethod.POST)
	public String removeForm(@RequestAttribute(value="id") String id) {
		// 관리자인지 체크
		formService.removeForm(id);
		
		return "/listForm.do";
	}
}
