package com.project.groupware.controller.approval;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.service.DocumentService;

@Controller
public class ApproveDocumentController {
	
	@Autowired
	private DocumentService documentService;
	
	// 결재 승인 폼 페이지 띄우기
	@RequestMapping(value="approveDocument.do", method=RequestMethod.GET)
	public ModelAndView form(
			@RequestParam(value="documentId", required=true) String documentId) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("documentId", documentId);
		mv.setViewName("approval/approveDocument");
		return mv;
	}
	
	// 결재 승인처리 -> approveSuccess.jsp -> 결재문서 조회 페이지.do
	@RequestMapping(value="approveDocument.do", method=RequestMethod.POST)
	public ModelAndView submit(
			@RequestParam(value="kind", required=true) String kind, // 승인, 반려체크
			@RequestParam(value="employeeId", required=true) String employeeId,
			@RequestParam(value="reply", required=true) String reply,
			@RequestParam(value="documentId", required=true) String documentId) {
		
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("employeeId", employeeId);
		map.put("reply", reply);
		map.put("documentId", documentId);
		
		Boolean isSuccess = false;
		if(kind.equals("1")) {
			isSuccess = documentService.approveDocument(map);
		} else if (kind.equals("2")) {
			isSuccess = documentService.rejectDocument(map);
		} 
		
		if(isSuccess) {
			// 성공하면 jsonView
			mv.setViewName("jsonView");
			return mv;
		} 
		return mv;
	}

}
