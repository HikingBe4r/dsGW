package com.project.groupware.controller.employee;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.service.EmployeeService;

@Controller
public class ListEmployeeController {
	@Autowired
	private EmployeeService service;
	
	@RequestMapping(value="/listEmployee.do", method=RequestMethod.GET)
	public ModelAndView listEmployee() {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> keyword = new HashMap<String, Object>();
		mv.addObject("employeeList", service.retrieveEmployeeList(keyword));
		mv.setViewName("adminNav/employee/listEmployee");
		return mv;
	}
	
	@RequestMapping(value="/listEmployee.do", method=RequestMethod.POST)
	public ModelAndView listEmployeePost() {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> keyword = new HashMap<String, Object>();		
		List<EmployeeVO> list = service.retrieveEmployeeList(keyword);	
		mv.addObject("employeeList", list);
		mv.setViewName("jsonView");
		return mv;
	}

}
