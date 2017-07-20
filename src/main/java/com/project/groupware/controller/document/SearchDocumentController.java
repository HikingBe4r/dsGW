package com.project.groupware.controller.document;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.service.DocumentService;

@Controller
public class SearchDocumentController {
	
	@Autowired
	private DocumentService DocumentService;	
	
	@RequestMapping(value="/searchDocument.do", method=RequestMethod.GET)
	public String searchDocument(HttpServletRequest request, Model model,
											@RequestParam(value="keyfield", required=false) String keyfield,
											@RequestParam(value="keyword", required=false) String keyword,
											@RequestParam(value="searchDay", required=false) String searchDay,
											@RequestParam(value="startDay", required=false, defaultValue="all") String startDay,
											@RequestParam(value="endDay", required=false, defaultValue="all") String endDay,
											@RequestParam(value="myDocs", required=false) String myDocs,
											@RequestParam(value="status", required=false) String status) {
		
		HttpSession session = request.getSession();
		EmployeeVO employee = (EmployeeVO)session.getAttribute("employee");
		
		Map<String, Object> map = new HashMap<String, Object>();		
		
		String employeeId = employee.getId();
		
		map.put("status", status);
		map.put("myDocs", myDocs);
		map.put("employeeId", employeeId);
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		map.put("searchDay", searchDay);
		map.put("startDay", startDay);
		map.put("endDay", endDay);
		
		model.addAttribute("status", status);
		model.addAttribute("myDocs", myDocs);
		model.addAttribute("documentList", DocumentService.retrieveDocumentList(map));
		
		return "jsonView";
		
	}
	
}