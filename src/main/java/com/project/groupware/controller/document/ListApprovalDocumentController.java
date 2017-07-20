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
import org.springframework.ui.Model;
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
	public ModelAndView listApprovalDocument(
			@SessionAttribute(value="employee", required=true) EmployeeVO employee,
			@RequestParam(value="kind", required=false) String kind,
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="boardId", required=true) String boardId,
			@RequestParam(value="currentPage", required=false) int currentPage,
			Model model) {
		
		ModelAndView mv = new ModelAndView();
				
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("employeeId", employee.getId());	
		map.put("kind", kind);
		map.put("keyword", keyword);
		map.put("boardId", boardId);
		
		// 각 documentList에 현재 결재자 추가
		
		List<Map<String, Object>> tempDocumentList = documentService.retrieveApprovalDocumentList(map);
		/*List<Map<String, Object>> documentList = new ArrayList<Map<String, Object>>();
		
		for(Map<String, Object> document: tempDocumentList) {
			ApproverVO currentApprover = (ApproverVO) document.get("currentApprover");
			System.out.println(currentApprover);
			if(boardId.equals("1")) {
				// 현재 결재문서
				if(document.get("MYAPPID") == currentApprover.getId()) {
					documentList.add(document);
				} 
			} else if (boardId.equals("3")) {
				// 미완료 문서
				if(document.get("MYAPPID") != currentApprover.getId()) {
					documentList.add(document);
				} 
			}
		}
		
		if (boardId.equals("2")) {
			documentList = tempDocumentList;	// 수신 문서는 그냥 그대로.
		}
		
		
		
		//  페이징 처리 시작
		if((Integer)currentPage == null) {
			currentPage = 1; // param이 비어있으면 현재페이지 = 첫페이지 
		}

		PagingVO paging = new PagingVO(currentPage, documentList.size());
				
		mv.addObject("paging", paging);*/
		//  페이징 처리 끝
		
		mv.addObject("documentList", tempDocumentList);
		mv.setViewName("approvalNav/document/listApprovalDocument");
		
		
		return mv;
	}
	
	@RequestMapping(value = "/selectListApprovalDocument.do", method=RequestMethod.POST)
	public String searchListApprovalDocument(
			@SessionAttribute(value="employee", required=true) EmployeeVO employee,
			@RequestParam(value="kind", required=true) String kind,
			@RequestParam(value="keyword", required=true) String keyword,
			@RequestParam(value="boardId", required=true) String boardId,
			@RequestParam(value="currentPage", required=true) int currentPage,
			Model model) {
				
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("employeeId", employee.getId());	
		map.put("kind", kind);
		map.put("keyword", keyword);
		map.put("boardId", boardId);
		
		// 각 documentList에 현재 결재자 추가		
		List<Map<String, Object>> tempDocumentList = documentService.retrieveApprovalDocumentList(map);
		List<Map<String, Object>> documentList = new ArrayList<Map<String, Object>>();
		
		for(Map<String, Object> document: tempDocumentList) {
			ApproverVO currentApprover = (ApproverVO) document.get("currentApprover");
			System.out.println(currentApprover);
			if(boardId.equals("1")) {
				// 현재 결재문서
				if(document.get("MYAPPID") == currentApprover.getId()) {
					documentList.add(document);
				} 
			} else if (boardId.equals("3")) {
				// 미완료 문서
				if(document.get("MYAPPID") != currentApprover.getId()) {
					documentList.add(document);
				} 
			}
		}
		
		if (boardId.equals("2")) {
			documentList = tempDocumentList;	// 수신 문서는 그냥 그대로.
		}
		
		model.addAttribute("documentList", documentList);
		
		//  페이징 처리 시작
		if((Integer)currentPage == null) {
			currentPage = 1; // param이 비어있으면 현재페이지 = 첫페이지 
		}

		PagingVO paging = new PagingVO(currentPage, documentList.size());
				
		model.addAttribute("paging", paging);
		//  페이징 처리 끝
		
		
		return "jsonView";
	}

}
