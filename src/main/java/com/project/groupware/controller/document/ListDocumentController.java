package com.project.groupware.controller.document;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.service.DocumentService;

@Controller
public class ListDocumentController {
	
	@Autowired
	private DocumentService DocumentService;	
	
	@RequestMapping(value="/listDocument.do", method=RequestMethod.GET)
	public ModelAndView listDocument(HttpServletRequest request/*, 
											@RequestParam(value="keyfield", required=false) String keyfield,
											@RequestParam(value="keyword", required=false) String keyword,
											@RequestParam(value="searchDay", required=false) String searchDay,
											@RequestParam(value="startDay", required=false, defaultValue="all") String startDay,
											@RequestParam(value="endDay", required=false, defaultValue="all") String endDay*/) {
		
		HttpSession session = request.getSession();
		EmployeeVO employee = (EmployeeVO)session.getAttribute("employee");
		
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int status = 0;
		int myDocs = 1;
		String employeeId = employee.getId();
		
		map.put("status", status);
		map.put("myDocs", myDocs);
		map.put("employeeId", employeeId);
		/*map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		map.put("searchDay", searchDay);
		map.put("startDay", startDay);
		map.put("endDay", endDay);*/
		
		mv.addObject("status", status);
		mv.addObject("myDocs", myDocs);
		mv.addObject("documentList", DocumentService.retrieveDocumentList(map));
		mv.setViewName("approvalNav/document/listDocument");
		
		return mv;
		
	}
	
}