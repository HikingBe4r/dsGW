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

import com.project.groupware.domain.EmployeeHistoryVO;
import com.project.groupware.service.EmployeeService;

@Controller
public class SearchEmpHistoryController {
	@Autowired
	private EmployeeService service;

	//게시글 검색 요청 처리 컨트롤러 메소드
	@RequestMapping(value="/searchEmpHistory.do", method=RequestMethod.GET)
	public String search(@RequestParam(value="keyfield", required=true)String keyfield, 
						 @RequestParam(value="keyword", required=false, defaultValue="all")String keyword,
						 Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);		
		List<EmployeeHistoryVO> empHistoryList = service.retrieveEmployeeHistory(map);
		
		model.addAttribute("empHistoryList", empHistoryList);		
		return "jsonView";
	}
	
	
}














