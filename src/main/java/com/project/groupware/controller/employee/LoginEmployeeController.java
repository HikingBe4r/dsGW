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
			session.setMaxInactiveInterval(20*60);
			if (login != null) {
				session.setAttribute("admin", login);
				return "admin/employee/listEmployee";// 사원 관리 페이지
			} else {
				
				return "login/loginFail";
			}
		} else {
			pwd = Encryption.encryption(pwd);
			EmployeeVO login = service.loginEmployee(new EmployeeVO(id, pwd));
			if (login != null) {
				session.setAttribute("employee", login);
				session.setAttribute("employeeDetail", service.retrieveEmployeeDetail(login.getId()));
				session.setAttribute("isread", service.checkIsRead(login.getId()));
				return "approvalNav/notice/listNotice";// 로그인후 알림 화면으로 이동
			} else {
				
				return "login/loginFail";
			}
		}
	}
}
