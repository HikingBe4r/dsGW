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
		pwd = Encryption.encryption(pwd);

		if (select.equals("admin")) {
			AdminVO login = new AdminVO();
			login.setId(id);
			login.setPassword(pwd);
			//관리자 비밀번호도 암호화 해야함 -> 기존 관리자 계정 삭제 후 다시 만들어야함 
			login = service.loginAdmin(login);
			session.setMaxInactiveInterval(20*60);
			if (login != null) {
				session.setAttribute("admin", login);
				return "adminNav/employee/listEmployee";// 사원 관리 페이지
			} else {
				
				return "login/loginFail";
			}
		} else {
			EmployeeVO login = service.loginEmployee(new EmployeeVO(id, pwd));
			if (login != null) {
				session.setAttribute("employee", login);
				session.setAttribute("employeeDetail", service.retrieveEmployeeDetail(login.getId()));
				return "approvalNav/board/board";// 메인화면 아직 없어서 보드로 가게 해놓음
			} else {
				
				return "login/loginFail";
			}
		}
	}
}
