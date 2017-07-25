/**
 *  결재 대기(결재차례), 
 *  수신(수신자), 
 *  미완료 문서(내 결재가 지나고, 아직 결재완료가 아닌 문서) 
 *  
 *  목록조회 컨트롤러
 */

package com.project.groupware.controller.document;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.ApproverVO;
import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.domain.PagingVO;
import com.project.groupware.service.DocumentService;

@Controller
public class ListApprovalDocumentController {

	@Autowired
	private DocumentService documentService;
	
	@RequestMapping(value = "/listApprovalDocument.do", method = RequestMethod.GET)
	public String listApprovalDocument() {
		return "approvalNav/document/listApprovalDocument";
	}
	
	@RequestMapping(value = "/selectListApprovalDocument.do", method=RequestMethod.GET)
	public ModelAndView searchListApprovalDocument(
			@SessionAttribute(value="employee", required=true) EmployeeVO employee,
			@RequestParam(value="keytype", required=true) String keytype,
			@RequestParam(value="keyword", required=true) String keyword,
			@RequestParam(value="boardId", required=true) String boardId,
			@RequestParam(value="currentPage", required=true) Integer currentPage) {
				
		ModelAndView mv = new ModelAndView();
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("employeeId", employee.getId());	
		map.put("keytype", keytype);
		map.put("keyword", keyword);
		map.put("boardId", boardId);
		
		// 각 documentList에 현재 결재자 추가
		
		List<Map<String, Object>> tempDocumentList = documentService.retrieveApprovalDocumentList(map);
		List<Map<String, Object>> documentList = new ArrayList<Map<String, Object>>();
		
		// 결재문서, 미완료문서는 현재 결재자인지에 따라서 조회결과가 바뀌어야 한다.
		for(Map<String, Object> document: tempDocumentList) {
			ApproverVO currentApprover = (ApproverVO) document.get("currentApprover");
			if(boardId.equals("1")) {
				// 현재 결재문서
				if(document.get("MYAPPID").toString().equals(currentApprover.getId())) {
					documentList.add(document);
				}
			} else if (boardId.equals("3")) {
				// 미완료 문서
				if(!document.get("MYAPPID").toString().equals(currentApprover.getId())){
					documentList.add(document);
				} 
			}
		}
		
		// 수신문서or 기안문서는 조회결과 그대로 보여줌
		if (boardId.equals("2") || boardId.equals("4")) {
			documentList = tempDocumentList;	// 수신 문서는 그냥 그대로.
		}
				
		//  페이징 처리 시작
		if(currentPage == null) {
			currentPage = 1; // param이 비어있으면 현재페이지 = 첫페이지 
		}

		PagingVO paging = new PagingVO(currentPage, documentList.size());
				
		mv.addObject("paging", paging);
		//  페이징 처리 끝
		
		mv.addObject("documentList", documentList);
		mv.setViewName("jsonView");
		
		
		return mv;
	}

}
