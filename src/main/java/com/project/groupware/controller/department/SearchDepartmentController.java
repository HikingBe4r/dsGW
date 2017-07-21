package com.project.groupware.controller.department;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.groupware.domain.DepartmentVO;
import com.project.groupware.service.DepartmentService;

@Controller
public class SearchDepartmentController {
	@Autowired
	private DepartmentService service;

	@RequestMapping(value="/searchDepartment.do", method=RequestMethod.GET)
	public String search(@RequestParam(value="keyfield", required=true)String keyfield, 
						 @RequestParam(value="keyword", required=false, defaultValue="all")String keyword,
						 Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);		
		List<DepartmentVO> departmentList = service.retrieveDepartmentList(map);
		
		model.addAttribute("departmentList", departmentList);		
		return "jsonView";
	}
	
	
}














