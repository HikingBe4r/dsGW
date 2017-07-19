package com.project.groupware.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.project.groupware.domain.AdminVO;
import com.project.groupware.domain.EmployeeVO;

public class AuthHandlerInterceptor extends HandlerInterceptorAdapter {
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		EmployeeVO employee = (EmployeeVO)session.getAttribute("employee");
		AdminVO admin = (AdminVO)session.getAttribute("admin");
		if(employee == null && admin == null){
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/login/loginForm.jsp");
			dispatcher.forward(request, response);
			return false;
		}else{
			return true;
		}
	}

	
}
