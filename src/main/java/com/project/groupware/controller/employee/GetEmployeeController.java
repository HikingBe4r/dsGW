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
public class GetEmployeeController {

	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value="/getEmployee.do", method=RequestMethod.POST)
	public ModelAndView getEmployee(@RequestParam(value="employeeId") String employeeId) {	
					
		ModelAndView mv = new ModelAndView();
		EmployeeVO employee = employeeService.retrieveEmployeeDetail(employeeId);
		mv.addObject("employee", employee);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
}
