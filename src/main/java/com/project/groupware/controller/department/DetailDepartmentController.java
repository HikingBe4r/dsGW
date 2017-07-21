package com.project.groupware.controller.department;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class DetailDepartmentController {
	
	@RequestMapping(value = "/detailDepartment.do", method = RequestMethod.GET)
	public String form(@RequestParam(value="id") String id, Model model) {
		model.addAttribute("deptid", id);
		return "adminNav/department/detailDepartment";
	}

}
