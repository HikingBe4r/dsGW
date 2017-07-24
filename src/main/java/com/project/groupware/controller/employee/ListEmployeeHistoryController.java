package com.project.groupware.controller.employee;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.PagingVO;
import com.project.groupware.service.EmployeeService;

@Controller
public class ListEmployeeHistoryController {
	@Autowired
	private EmployeeService service;

	@RequestMapping(value = "/listEmpHistory.do", method = RequestMethod.GET)
	public ModelAndView listEmployeeHistroy(@RequestParam(value = "currentPage", required = false) Integer currentPage) {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> keyword = new HashMap<String, Object>();

		// 페이징 처리 시작
		if (currentPage == null) {
			currentPage = 1; // param이 비어있으면 현재페이지 = 첫페이지
		}

		PagingVO paging = new PagingVO(currentPage, service.retrieveEmployeeHistory(keyword).size());

		mv.addObject("paging", paging);
		// 페이징 처리 끝
		mv.addObject("empHistoryList", service.retrieveEmployeeHistory(keyword));
		mv.setViewName("adminNav/employee/listEmpHistory");
		return mv;
	}
}
