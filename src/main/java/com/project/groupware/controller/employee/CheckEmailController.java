package com.project.groupware.controller.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.service.EmployeeService;

@Controller
public class CheckEmailController {
	@Autowired
	private EmployeeService service;

	// 게시글 검색 요청 처리 컨트롤러 메소드
	@RequestMapping(value = "/checkEmail.do", method = RequestMethod.POST)
	public ModelAndView check(@RequestParam(value="email")String email) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("check", service.checkEmail(email));
		mv.setViewName("jsonView");
		return mv;
	}

}
