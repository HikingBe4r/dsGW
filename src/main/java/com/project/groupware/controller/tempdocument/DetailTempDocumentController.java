package com.project.groupware.controller.tempdocument;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.domain.TempDocumentVO;
import com.project.groupware.service.DepartmentService;
import com.project.groupware.service.TempDocumentService;

@Controller
public class DetailTempDocumentController {
	
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private TempDocumentService tempDocumentService;	
	
	
	@RequestMapping(value="/detailTempDocument.do", method=RequestMethod.GET)
	public String form(@RequestParam(value="id", required=true) String tempDocumentId, 
					   HttpServletRequest request, Model model) {			
		
		HttpSession session = request.getSession();
		EmployeeVO employee = (EmployeeVO)session.getAttribute("employee");
		
		TempDocumentVO tempDocument = tempDocumentService.retrieveTempDocument(Integer.parseInt(tempDocumentId));
		tempDocument.setContent(tempDocument.getContent().replaceAll("\n", ""));
		tempDocument.setContent(tempDocument.getContent().replaceAll("\r", ""));
		tempDocument.setContent(tempDocument.getContent().replaceAll("'", "\""));
		
		model.addAttribute(tempDocument.getFormVO());
		model.addAttribute("tempDocumentVO", tempDocument);
		model.addAttribute("formId", tempDocument.getFormVO().getId());
		System.out.println("dTController formId : " + tempDocument.getFormVO().getId());
		model.addAttribute("department", departmentService.retrieveDepartment(employee.getDepartmentId()));
		return "approvalNav/tempdocument/detailTempDocument";
		//return "approvalNav/document/writeDocument";
	}
	
	@RequestMapping(value="/detailTempDocument.do", method=RequestMethod.POST)
	public String submit(/*@ModelAttribute(value="documentVO") DocumentVO documentVO, Model model*/) {
		
		//documentService.registerDocument(documentVO);
		
		//tempDocumentService.removeTempDocument(tempDocumentId);
		
		return "redirect:/listTempDocument.do";
		
	}
	
}