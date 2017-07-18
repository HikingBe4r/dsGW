package com.project.groupware.controller.employee;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.service.EmployeeService;

@Controller
public class ListEmployeeHistoryController {
	@Autowired
	private EmployeeService service;

	@RequestMapping(value = "/listEmpHistory.do", method = RequestMethod.GET)
	public ModelAndView listEmployeeHistroy() {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> keyword = new HashMap<String, Object>();
		mv.addObject("EmpHistoryList", service.retrieveEmployeeHistory(keyword));
		mv.setViewName("approvalNav/employee/listEmpHistory");
		return mv;
	}
}
