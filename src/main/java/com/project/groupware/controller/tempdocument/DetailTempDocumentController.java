package com.project.groupware.controller.tempdocument;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.groupware.domain.DocumentVO;
import com.project.groupware.service.DocumentService;
import com.project.groupware.service.TempDocumentService;

@Controller
public class DetailTempDocumentController {
	
	@Autowired
	private DocumentService documentService;
	
	@Autowired
	private TempDocumentService tempDocumentService;	
	
	@RequestMapping(value="/detailTempDocument.do", method=RequestMethod.GET)
	public String form(@RequestParam(value="id", required=true) String tempDocumentId, Model model) {			
		
		model.addAttribute("tempDocumentVO", tempDocumentService.retrieveTempDocument(Integer.parseInt(tempDocumentId)));
		
		return "approvalNav/tempdocument/detailTempDocument";
	}
	
	@RequestMapping(value="/detailTempDocument.do", method=RequestMethod.POST)
	public String submit(/*@ModelAttribute(value="documentVO") DocumentVO documentVO, Model model*/) {
		
		//documentService.registerDocument(documentVO);
		
		//tempDocumentService.removeTempDocument(tempDocumentId);
		
		return "redirect:/listTempDocument.do";
		
	}
	
}