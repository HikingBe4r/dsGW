package com.project.groupware.controller.employee;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.domain.PagingVO;
import com.project.groupware.service.EmployeeService;

@Controller
public class ListEmployeeController {
	@Autowired
	private EmployeeService service;

	@RequestMapping(value = "/listEmployee.do", method = RequestMethod.GET)
	public ModelAndView listEmployee(@RequestParam(value = "currentPage", required = false) Integer currentPage) {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> keyword = new HashMap<String, Object>();

		// 페이징 처리 시작
		if (currentPage == null) {
			currentPage = 1; // param이 비어있으면 현재페이지 = 첫페이지
		}

		PagingVO paging = new PagingVO(currentPage, service.retrieveEmployeeList(keyword).size());

		mv.addObject("paging", paging);
		// 페이징 처리 끝

		mv.addObject("employeeList", service.retrieveEmployeeList(keyword));
		mv.setViewName("adminNav/employee/listEmployee");
		return mv;
	}

	@RequestMapping(value = "/listEmployee.do", method = RequestMethod.POST)
	public String listEmployeePost(Model model) {

		Map<String, Object> keyword = new HashMap<String, Object>();
		List<EmployeeVO> empList = service.retrieveEmployeeDetailList(keyword);

		model.addAttribute("employeeList", empList);
		return "jsonView";
	}

}
