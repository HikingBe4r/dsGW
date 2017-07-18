package com.project.groupware.controller.employee;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FindEmployeeFormController {
	@RequestMapping(value = "/findEmployeeId.do", method = RequestMethod.GET)
	public String FindForm() {
		return "login/findEmployeeId";
	}
}