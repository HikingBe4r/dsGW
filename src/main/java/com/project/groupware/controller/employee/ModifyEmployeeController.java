package com.project.groupware.controller.employee;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.service.DepartmentService;
import com.project.groupware.service.EmployeeService;

@Controller
public class ModifyEmployeeController {
	
	@Autowired
	private EmployeeService service;
	
	@Autowired
	private DepartmentService deptService;
	
	// 게시글 수정 폼 요청 처리
	@RequestMapping(value = "/modifyEmployee.do", method = RequestMethod.GET)
	public String form(@RequestParam(value = "id") String id, Model model) {
		Map<String, Object> keyword = new HashMap<String, Object>();
		model.addAttribute("employee", service.retrieveEmployee(id));
		model.addAttribute("deptList", deptService.retrieveDepartmentList(keyword));
		model.addAttribute("gradeList", service.retrieveGradeList());
		model.addAttribute("statusList", service.retrieveStatusList());
		return "adminNav/employee/modifyEmployeeForm";
	}

	// 게시글 수정 요청 처리
	@RequestMapping(value = "/modifyEmployee.do", method = RequestMethod.POST)
	public String submit(@ModelAttribute(value = "employee") EmployeeVO emp, Model model) {
			service.modifyEmployee(emp);
			return "redirect:/listEmployee.do";
	}
}
