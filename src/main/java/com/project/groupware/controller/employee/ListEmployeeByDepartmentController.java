package com.project.groupware.controller.employee;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.service.EmployeeService;

@Controller
public class ListEmployeeByDepartmentController {
	@Autowired
	private EmployeeService service;
	
	@RequestMapping(value="/listEmployeeByDepartment.do", method=RequestMethod.POST)
	public String listEmployeeByDepartment(@RequestParam(value="departmentId") String departmentId,
											Model model) {
		
		List<EmployeeVO> empByDeptList = service.retrieveEmployeeByDepartment(departmentId);
		System.out.println("deptId : " + departmentId + ", size :  " + empByDeptList.size());
		model.addAttribute("empByDeptList", empByDeptList);
		return "jsonView";
	}

}
