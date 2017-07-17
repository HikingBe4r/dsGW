package com.project.groupware.controller.approval;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.ApprovalHistoryVO;
import com.project.groupware.service.DocumentService;

@Controller
public class ApproveDocumentController {
	
	@Autowired
	private DocumentService documentService;
	
	/*// 결재 승인 폼 페이지 띄우기
	@RequestMapping(value="approveDocument.do", method=RequestMethod.GET)
	public String form() {
		return null;
	}
	*/
	// 결재 승인처리 -> approveSuccess.jsp -> 결재문서 조회 페이지.do
	@RequestMapping(value="approveDocument.do", method=RequestMethod.GET)
	public ModelAndView submit(
			@RequestAttribute(value="approvalHistoryVO", required=true) ApprovalHistoryVO appHistory) {
		
		
		
		
		
		return null;
	}

}
