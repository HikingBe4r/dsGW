package com.project.groupware.controller.employee;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.groupware.domain.AdminVO;
import com.project.groupware.domain.EmployeeVO;

@Controller
public class LogoutEmployeeController {
	
	@RequestMapping(value = "/logout.do", method = RequestMethod.POST)
	public String logout(HttpSession session, Model model){
		AdminVO sessionAdmin = (AdminVO) session.getAttribute("admin");
		EmployeeVO sessionEmp = (EmployeeVO) session.getAttribute("employee");
/*		if(sessionAdmin != null){
			session.removeAttribute("admin");
		}else if(sessionEmp != null){
			session.removeAttribute("employee");
		}*/
		
		session.invalidate();
		
		return "login/loginForm";
	}

}
