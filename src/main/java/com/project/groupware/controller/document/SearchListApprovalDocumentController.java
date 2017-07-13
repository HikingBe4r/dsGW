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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.service.DocumentService;

@Controller
public class SearchListApprovalDocumentController {

	@Autowired
	private DocumentService documentService;

	@RequestMapping(value = "/searchListApprovalDocument.do", method = RequestMethod.GET)
	public String searchListApprovalDocument(
			@RequestParam(value="kind", required=true) String kind,
			@RequestParam(value="keyword", required=true) String keyword,
			Model model) {
		
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("employeeId", 1);	//map.put("employeeId", sessionScope.emp_id);
		map.put("kind", kind);
		map.put("keyword", keyword);
		
		model.addAttribute("documentList", documentService.retrieveApprovalDocumentList(map));
		

		return "jsonView";
	}

}
