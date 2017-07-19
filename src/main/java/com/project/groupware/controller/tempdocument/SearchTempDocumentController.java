package com.project.groupware.controller.tempdocument;

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
import com.project.groupware.service.TempDocumentService;

@Controller
public class SearchTempDocumentController {
	
	@Autowired
	private TempDocumentService tempDocumentService;
	
	@RequestMapping(value="/searchTempDocument.do", method=RequestMethod.GET)
	public String searchTempDocument(HttpServletRequest request, Model model,
										@RequestParam(value="keyfield", required=false) String keyfield,
										@RequestParam(value="keyword", required=false) String keyword,
										@RequestParam(value="startDay", required=false, defaultValue="all") String startDay,
										@RequestParam(value="endDay", required=false, defaultValue="all") String endDay) {
		
		HttpSession session = request.getSession();
		EmployeeVO employee = (EmployeeVO)session.getAttribute("employee");
		
		//ModelAndView mv = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String employeeId = employee.getId();
		
		map.put("employeeId", employeeId);
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		map.put("startDay", startDay);
		map.put("endDay", endDay);
		
		model.addAttribute("tempDocumentList", tempDocumentService.retrieveTempDocumentList(map));
		//mv.setViewName("approvalNav/tempdocument/listTempDocument");
		
		return "jsonView";
		
	}
	
}