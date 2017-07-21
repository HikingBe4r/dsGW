package com.project.groupware.controller.employee;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ModifyPasswordFormController {

	@RequestMapping(value = "/modifyPwd.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String form(@RequestParam("id") String id, Model model) {
		model.addAttribute("id", id);
		return "employee/modifyPwd";
	}

}
