package com.project.groupware.controller.tempdocument;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.groupware.domain.FormVO;
import com.project.groupware.domain.TempDocumentVO;
import com.project.groupware.service.TempDocumentService;

@Controller
public class WriteTempDocumentController {
	
	@Autowired
	private TempDocumentService tempDocumentService;
	
	@RequestMapping(value="/writeTempDocument.do", method=RequestMethod.POST)
	public String writeTempDocument(@RequestParam(value="employeeId") String employeeId,
									@RequestParam(value="subject") String subject,
									@RequestParam(value="content") String content,
									@RequestParam(value="endDate") String endDate,
									@RequestParam(value="formId") String formId) {
		
		TempDocumentVO tempDocument = new TempDocumentVO();
		tempDocument.setEmployeeId(employeeId);
		tempDocument.setSubject(subject);
		tempDocument.setContent(content);
		tempDocument.setEndDate(endDate);
		FormVO form = new FormVO();
		form.setId(formId);
		tempDocument.setFormVO(form);
		
		tempDocumentService.registerTempDocument(tempDocument);
		return "jsonView";
		
		
	}
	
	
	
	
}
