package com.project.groupware.controller.employee;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.groupware.domain.AdminVO;
import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.service.EmployeeService;

@Controller
public class LoginEmployeeController {

	@Autowired
	private EmployeeService service;

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginForm() {
		return "login/loginForm";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String submit(@RequestParam(value = "employeeId") String id, @RequestParam(value = "password") String pwd,
			HttpSession session, @RequestParam(value = "select") String select, Model model) {

		if (select.equals("admin")) {
			AdminVO login = new AdminVO();
			login.setId(id);
			login.setPassword(pwd);
			login = service.loginAdmin(login);
			if (login != null) {
				session.setAttribute("employee", login);
				return "approvalNav/board/board";// 메인화면 아직 없어서 보드로 가게 해놓음
			} else {
				
				return "login/loginForm";
			}
		} else {
			EmployeeVO login = service.loginEmployee(new EmployeeVO(id, pwd));
			if (login != null) {
				session.setAttribute("employee", login);
				return "approvalNav/board/board";// 메인화면 아직 없어서 보드로 가게 해놓음
			} else {
				
				return "login/loginForm";
			}
		}
	}
}
