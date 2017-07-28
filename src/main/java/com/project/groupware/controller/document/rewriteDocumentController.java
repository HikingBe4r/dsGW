package com.project.groupware.controller.document;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class rewriteDocumentController {
	
	@RequestMapping(value="/rewriteDocument.do", method=RequestMethod.GET)
	public String rewriteDocumentForm(@RequestParam(value="subject") String subject,
								  @RequestParam(value="content") String content,
								  @RequestParam(value="endDate") String endDate,
								  @RequestParam(value="formId") String formId,
								  Model model) {
		
		model.addAttribute("subject", subject);
		model.addAttribute("content", content);
		model.addAttribute("endDate", endDate.substring(0, 10));
		model.addAttribute("formId", formId);
		
	
		return "approvalNav/document/rewriteDocument";
	}

}
