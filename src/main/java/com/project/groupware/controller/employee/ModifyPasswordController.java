package com.project.groupware.controller.employee;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.service.EmployeeService;

@Controller
public class ModifyPasswordController {
	
	@Autowired
	private EmployeeService service;
	
	@RequestMapping(value = "/modifyPwd.do", method = RequestMethod.GET)
	public String form(@RequestAttribute("id") String id, Model model) {
		EmployeeVO employee = service.retrieveEmployee(id);
		model.addAttribute("findEmployee", employee);
		return "employee/modifyPwd";
	}
	
	@RequestMapping(value = "/modifyPwd.do", method = RequestMethod.POST)
	public ModelAndView submit(@RequestParam(value = "password") String pwd, @RequestParam("findEmployee") EmployeeVO employee) {
		ModelAndView mv = new ModelAndView();
		employee.setPassword(pwd);
		service.modifyPassword(employee);
		return mv;
	}

}
