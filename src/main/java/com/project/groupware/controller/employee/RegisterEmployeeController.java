package com.project.groupware.controller.employee;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.service.DepartmentService;
import com.project.groupware.service.EmployeeService;

@Controller
public class RegisterEmployeeController {
	
	@Autowired
	private DepartmentService deptService;
	
	@Autowired
	private EmployeeService empService;
	
	@RequestMapping(value = "/registerEmployee.do", method = RequestMethod.GET)
	public ModelAndView Form() {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> keyword = new HashMap<String, Object>();
		mv.addObject("deptList", deptService.retrieveDepartmentList(keyword));
		mv.addObject("gradeList", empService.retrieveGradeList());
		mv.addObject("statusList", empService.retrieveStatusList());
		mv.setViewName("adminNav/employee/registerEmployeeForm");
		return mv;
	}
	
	@RequestMapping(value = "/registerEmployee.do", method = RequestMethod.POST)
	public String submit(@ModelAttribute(value="employee") EmployeeVO emp) {
		emp.setPassword(Encryption.encryption(emp.getPassword()));
		empService.registerEmployee(emp);
		return "redirect:/listEmployee.do";
	}
	
}
