/**
 * 결재 문서 상세조회 컨트롤러.
 * 해당 문서의 정보를 상세조회한다.
 * 선택한 문서의 id를 통해서 읽어낸다.
 */

package com.project.groupware.controller.document;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.service.DocumentService;


@Controller
public class DetailApprovalDocumentController {
	
	@Autowired
	private DocumentService documentService;
	
	@RequestMapping(value="/detailApprovalDocument.do", method=RequestMethod.GET)
	public ModelAndView detailApprovalDocument(
			@RequestParam(value="documentId", required=true) String documentId) {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> approvalDocument = documentService.retrieveApprovalDocument(documentId);
		
		
		
		
		mv.addObject("approvalDocument", approvalDocument);
		mv.setViewName("approvalNav/document/detailDocument");
		
		return mv;
	}	
}
