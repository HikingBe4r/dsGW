package com.project.groupware.controller.form;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.groupware.service.FormService;

@Controller
public class RemoveFormController {
	
	@Autowired
	private FormService formService;
	
	@RequestMapping(value="/removeForm.do", method=RequestMethod.GET)
	public String removeForm(@RequestParam(value="formId", required=true) String formId) {
		// 관리자인지 체크
		formService.removeForm(formId);
		
		return "/listForm.do";
	}
}
