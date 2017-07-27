package com.project.groupware.controller.employee;

import java.util.HashMap;
import java.util.Map;

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
	public String loginForm(HttpSession session) {
		if(session.getAttribute("admin") != null){
			session.removeAttribute("employee");
			return "adminNav/employee/listEmployee";
		}else if(session.getAttribute("employee") != null){
			return "approvalNav/notice/listNotice";
		}else{
			return "login/loginForm";
		}
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
				return "adminNav/employee/listEmployee";// 사원 관리 페이지
			} else {
				
				return "login/loginFail";
			}
		} else {
			pwd = Encryption.encryption(pwd);
			EmployeeVO login = service.loginEmployee(new EmployeeVO(id, pwd));
			if (login != null) {
				Map<String, Object>keyword = new HashMap<String, Object>();
				session.setAttribute("employee", login);
				session.setAttribute("employeeDetail", service.retrieveEmployeeDetail(login.getId()));
				
				keyword.put("employeeVO", login);
				keyword.put("kind", "1");
				session.setAttribute("empImage1", service.retrieveEmployeeImage(keyword));
				keyword.clear();
				
				keyword.put("employeeVO", login);
				keyword.put("kind", "2");
				session.setAttribute("empImage2", service.retrieveEmployeeImage(keyword));
				
				
				model.addAttribute("isread", service.checkIsRead(login.getId()));
				return "approvalNav/notice/listNotice";// 로그인후 알림 화면으로 이동
			} else {
				
				return "login/loginFail";
			}
		}
	}
}
