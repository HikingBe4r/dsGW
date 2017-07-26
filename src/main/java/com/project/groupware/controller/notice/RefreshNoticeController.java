package com.project.groupware.controller.notice;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.service.EmployeeService;

@Controller
public class RefreshNoticeController {
	@Autowired
	private EmployeeService service;

	@RequestMapping(value = "/refreshNav.do", method = RequestMethod.GET)
	public ModelAndView refreshNav(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		EmployeeVO emp = new EmployeeVO();
		emp = (EmployeeVO) session.getAttribute("employee");
		int nowCount = service.checkIsRead(emp.getId());
		mv.addObject("isread", nowCount);
		mv.setViewName("jsonView");
		return mv;
	}

}
