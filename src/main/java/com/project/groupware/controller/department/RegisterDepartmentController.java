package com.project.groupware.controller.department;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.groupware.domain.DepartmentVO;
import com.project.groupware.service.DepartmentService;

@Controller
public class RegisterDepartmentController {
	
	@Autowired
	private DepartmentService service;
	
	@RequestMapping(value = "/registerDepartment.do", method = RequestMethod.GET)
	public String form() {
		return "department/registerDepartment";
	}
	
	@RequestMapping(value = "/registerSuccess.do", method = RequestMethod.POST)
	public String submit(@RequestParam(value="deptid") String id, @RequestParam(value="deptname") String name) {
		DepartmentVO dept = new DepartmentVO();
		dept.setId(id);
		dept.setName(name);
		service.registerDepartment(dept);
		return "department/registerSuccess";
	}
}
