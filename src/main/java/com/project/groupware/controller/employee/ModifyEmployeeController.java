package com.project.groupware.controller.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.service.EmployeeService;

@Controller
public class ModifyEmployeeController {
	
	@Autowired
	private EmployeeService service;
	
	// 게시글 수정 폼 요청 처리
	@RequestMapping(value = "/modifyEmployee.do", method = RequestMethod.GET)
	public String form(@RequestParam(value = "id") String id, Model model) {
		model.addAttribute("employee", service.retrieveEmployee(id));
		return "approvalNav/employee/modifyEmployeeForm";
	}

	// 게시글 수정 요청 처리
	@RequestMapping(value = "/modifyEmployee.do", method = RequestMethod.POST)
	public String submit(@ModelAttribute(value = "article") EmployeeVO emp, Model model) {
			service.modifyEmployee(emp);
			return "redirect:/listEmployee.do";
	}
}
