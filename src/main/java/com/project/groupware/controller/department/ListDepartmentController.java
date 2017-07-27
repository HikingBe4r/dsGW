package com.project.groupware.controller.department;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.DepartmentVO;
import com.project.groupware.domain.PagingVO;
import com.project.groupware.service.DepartmentService;

@Controller
public class ListDepartmentController {
	@Autowired
	private DepartmentService service;

	@RequestMapping(value = "/listDepartment.do", method = RequestMethod.GET)
	public ModelAndView listDepartment(@RequestParam(value = "currentPage", required = false) Integer currentPage) {
		ModelAndView mv = new ModelAndView();

		Map<String, Object> keyword = new HashMap<String, Object>();
		List<DepartmentVO> departmentList = service.retrieveDepartmentList(keyword);
		// 페이징 처리 시작
		if (currentPage == null) {
			currentPage = 1; // param이 비어있으면 현재페이지 = 첫페이지
		}

		PagingVO paging = new PagingVO(currentPage, departmentList.size());

		mv.addObject("paging", paging);
		// 페이징 처리 끝
		mv.addObject("departmentList", departmentList);
		mv.setViewName("adminNav/department/listDepartment");
		return mv;
	}

	@RequestMapping(value = "/listDepartment.do", method = RequestMethod.POST)
	public ModelAndView listDepartmentPost() {
		ModelAndView mv = new ModelAndView();
		//Map<String, Object> keyword = new HashMap<String, Object>();
		mv.addObject("departmentList", service.retrieveDepartmentListWithCount());
		mv.setViewName("jsonView");
		return mv;
	}
}
