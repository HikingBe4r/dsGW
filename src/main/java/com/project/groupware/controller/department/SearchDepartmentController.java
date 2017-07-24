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
public class SearchDepartmentController {
	@Autowired
	private DepartmentService service;

	@RequestMapping(value = "/searchDepartment.do", method = RequestMethod.GET)
	public ModelAndView search(@RequestParam(value = "keyfield", required = true) String keyfield,
			@RequestParam(value = "keyword", required = false, defaultValue = "all") String keyword,
			@RequestParam(value = "currentPage", required = true) Integer currentPage) {

		ModelAndView mv = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		List<DepartmentVO> departmentList = service.retrieveDepartmentList(map);

		// 페이징 처리 시작
		if (currentPage == null) {
			currentPage = 1; // param이 비어있으면 현재페이지 = 첫페이지
		}

		PagingVO paging = new PagingVO(currentPage, departmentList.size());

		mv.addObject("paging", paging);
		// 페이징 처리 끝

		mv.addObject("departmentList", departmentList);
		mv.setViewName("jsonView");
		return mv;
	}

}
