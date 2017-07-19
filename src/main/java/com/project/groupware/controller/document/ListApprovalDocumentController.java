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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.service.DocumentService;

@Controller
public class ListApprovalDocumentController {

	@Autowired
	private DocumentService documentService;

	@RequestMapping(value = "/listApprovalDocument.do", method = RequestMethod.GET)
	public ModelAndView listApprovalDocument(
			@SessionAttribute(value="employee", required=true) EmployeeVO employee,
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="kind", required=false) String kind,
			@RequestParam(value="boardId", required=false) String boardId
			/*@RequestAttribute(value="keyword", required=false) Map<String, Object> keyword*/) {
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("employeeId", employee.getId());	// sessionScope의 로그인 한 사원 ID
		map.put("kind", kind);
		map.put("keyword", keyword);
		map.put("boardId", boardId);
		
		mv.addObject("documentList", documentService.retrieveApprovalDocumentList(map));
		mv.setViewName("approvalNav/document/listApprovalDocument");

		return mv;
	}
	
	@RequestMapping(value = "/searchListApprovalDocument.do", method = RequestMethod.GET)
	public String searchListApprovalDocument(
			@SessionAttribute(value="employee", required=true) EmployeeVO employee,
			@RequestParam(value="kind", required=true) String kind,
			@RequestParam(value="keyword", required=true) String keyword,
			@RequestParam(value="boardId", required=false) String boardId,
			Model model) {
		
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("employeeId", employee.getId());	
		map.put("kind", kind);
		map.put("keyword", keyword);
		map.put("boardId", boardId);
		
		model.addAttribute("documentList", documentService.retrieveApprovalDocumentList(map));
		

		return "jsonView";
	}

}
