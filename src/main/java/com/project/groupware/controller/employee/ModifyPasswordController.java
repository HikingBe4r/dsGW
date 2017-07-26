package com.project.groupware.controller.employee;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	@RequestMapping(value = "/successPwd.do", method = RequestMethod.POST)
	public ModelAndView submit(@RequestParam(value = "password") String pwd, @RequestParam(value = "id") String id) {
		ModelAndView mv = new ModelAndView();
		EmployeeVO employee = service.retrieveEmployee(id);
		employee.setPassword(Encryption.encryption(pwd));
		service.modifyPassword(employee);
		mv.setViewName("employee/successPwd");
		return mv;
	}

}
