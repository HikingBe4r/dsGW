package com.project.groupware.controller.department;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.groupware.service.DepartmentService;

@Controller
public class ModifyDepartmentController {

	@Autowired
	private DepartmentService service;
	
	@RequestMapping(value="/modifyDepartment.do", method=RequestMethod.POST)
	public String submit(@RequestParam(value="departmentEmpList") List<String> departmentEmpList){
		
		
		return "jsonView";
	}
}
