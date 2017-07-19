package com.project.groupware.controller.department;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.service.DepartmentService;

@Controller
public class ListDepartmentController {
	@Autowired
	private DepartmentService service;
	
	@RequestMapping(value="/listDepartment.do", method=RequestMethod.GET)
	public ModelAndView listDepartment() {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> keyword = new HashMap<String, Object>();
		mv.addObject("departmentList", service.retrieveDepartmentList(keyword));
		mv.setViewName("adminNav/department/listDepartment");
		return mv;
	}
	
	
	@RequestMapping(value="/listDepartment.do", method=RequestMethod.POST)
	public ModelAndView listDepartmentPost() {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> keyword = new HashMap<String, Object>();
		mv.addObject("departmentList", service.retrieveDepartmentList(keyword));
		mv.setViewName("jsonView");
		return mv;
	}
}
