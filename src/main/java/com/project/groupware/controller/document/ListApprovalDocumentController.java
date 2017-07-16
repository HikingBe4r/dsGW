/**
 *  결재 대기(결재차례), 
 *  수신(수신자), 
 *  미완료 문서(내 결재가 지나고, 아직 결재완료가 아닌 문서) 
 *  
 *  목록조회 컨트롤러
 */

package com.project.groupware.controller.document;

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
public class ListApprovalDocumentController {

	@Autowired
	private DocumentService documentService;

	@RequestMapping(value = "/listApprovalDocument.do", method = RequestMethod.GET)
	public ModelAndView listApprovalDocument(
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="kind", required=false) String kind
			/*@RequestAttribute(value="keyword", required=false) Map<String, Object> keyword*/) {
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("employeeId", "20170711001");	// sessionScope의 로그인 한 사원 ID
		map.put("kind", kind);
		map.put("keyword", keyword);
		
		mv.addObject("documentList", documentService.retrieveApprovalDocumentList(map));
		mv.setViewName("approvalNav/document/listApprovalDocument");

		return mv;
	}

}
