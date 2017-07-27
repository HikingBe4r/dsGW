package com.project.groupware.controller.tempdocument;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.groupware.domain.TempDocumentVO;
import com.project.groupware.service.TempDocumentService;

@Controller
public class ModifyTempDocumentController {
	
	@Autowired
	private TempDocumentService tempDocumentService;
	
	@RequestMapping(value="/modifyTempDocument.do", method=RequestMethod.POST)
	public String modifyTempDocument(@ModelAttribute(value="tempDocumentVO") TempDocumentVO tempDocumentVO, Model model) {
		
		tempDocumentService.modifyTempDocument(tempDocumentVO);
		
		return "jsonView";
		
	}
}