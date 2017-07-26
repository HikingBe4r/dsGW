package com.project.groupware.controller.document;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.domain.PagingVO;
import com.project.groupware.service.DocumentService;

@Controller
public class ListDocumentController {
	
	@Autowired
	private DocumentService documentService;	
	
	@RequestMapping(value="/listDocument.do", method=RequestMethod.GET)
	public ModelAndView listDocument(HttpServletRequest request/*,
										@RequestParam(value="currentPage", required=false) Integer currentPage,
										@RequestParam(value="status", required=false) int status,
										@RequestParam(value="myDocs", required=false) int myDocs*/) {
		
		HttpSession session = request.getSession();
		EmployeeVO employee = (EmployeeVO)session.getAttribute("employee");
		
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		//개인문서 - myDocs = 1, status = 0	승인/반려문서 - myDocs = 2, status = 3 or 4		수신문서 - myDocs = 2, status = 5
		int status = 0;
		int myDocs = 1;
		
		String employeeId = employee.getId();
		
		map.put("status", status);
		map.put("myDocs", myDocs);
		map.put("employeeId", employeeId);
		
		//  페이징 처리 시작
		/*if(currentPage == null) {
			currentPage = 1; // param이 비어있으면 현재페이지 = 첫페이지 
		}

		PagingVO paging = new PagingVO(currentPage, documentService.retrieveDocumentList(map).size());
				
		mv.addObject("paging", paging);*/
		//  페이징 처리 끝
		
		mv.addObject("status", status);
		mv.addObject("myDocs", myDocs);
		mv.addObject("documentList", documentService.retrieveDocumentList(map));
		mv.setViewName("approvalNav/document/listDocument");
		
		return mv;
		
	}
	
	@RequestMapping(value="/searchDocument.do", method=RequestMethod.GET)
	public String searchDocument(HttpServletRequest request, Model model,
											@RequestParam(value="keyfield", required=false) String keyfield,
											@RequestParam(value="keyword", required=false) String keyword,
											@RequestParam(value="searchDay", required=false) String searchDay,
											@RequestParam(value="startDay", required=false, defaultValue="all") String startDay,
											@RequestParam(value="endDay", required=false, defaultValue="all") String endDay,
											@RequestParam(value="myDocs", required=false) String myDocs,
											@RequestParam(value="status", required=false) String status,
											@RequestParam(value="searchStatus", required=false) String searchStatus,
											@RequestParam(value="currentPage", required=false) Integer currentPage) {
		
		HttpSession session = request.getSession();
		EmployeeVO employee = (EmployeeVO)session.getAttribute("employee");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String employeeId = employee.getId();
		
		map.put("status", status);
		map.put("myDocs", myDocs);
		map.put("employeeId", employeeId);
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		map.put("searchDay", searchDay);
		map.put("startDay", startDay);
		map.put("endDay", endDay);
		map.put("searchStatus", searchStatus);
		
		//  페이징 처리 시작
		if(currentPage == null) {
			currentPage = 1; // param이 비어있으면 현재페이지 = 첫페이지 
		}

		PagingVO paging = new PagingVO(currentPage, documentService.retrieveDocumentList(map).size());
		
		model.addAttribute("paging", paging);
		
		session.setAttribute("currentPage", currentPage);
		//  페이징 처리 끝
		
		model.addAttribute("status", status);
		model.addAttribute("myDocs", myDocs);
		model.addAttribute("documentList", documentService.retrieveDocumentList(map));
		
		return "jsonView";
		
	}
	
	@RequestMapping(value="/deleteMyDocs.do", method=RequestMethod.GET)
	public String deleteMyDocs(HttpServletRequest request, Model model,
										@RequestParam(value="keyfield", required=false) String keyfield,
										@RequestParam(value="keyword", required=false) String keyword,
										@RequestParam(value="searchDay", required=false) String searchDay,
										@RequestParam(value="startDay", required=false, defaultValue="all") String startDay,
										@RequestParam(value="endDay", required=false, defaultValue="all") String endDay,
										@RequestParam(value="myDocs", required=false) String myDocs,
										@RequestParam(value="status", required=false) String status,
										@RequestParam(value="searchStatus", required=false) String searchStatus,
										@RequestParam(value="checkRow", required=false) String checkRow) {
		
		HttpSession session = request.getSession();
		EmployeeVO employee = (EmployeeVO)session.getAttribute("employee");
		
		String employeeId = employee.getId();
		String[] documentIds = checkRow.split(", ");
		
		List<String> documentIdList = new ArrayList<String>();
		
		for (String documentId : documentIds) {
			documentIdList.add(documentId);
		}
		
		Map<String, Object> map1 = new HashMap<String, Object>();
		
		map1.put("documentIdList", documentIdList);
		map1.put("employeeId", employeeId);
		
		documentService.removeBookMarkDocument(map1);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("status", status);
		map.put("myDocs", myDocs);
		map.put("employeeId", employeeId);
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		map.put("searchDay", searchDay);
		map.put("startDay", startDay);
		map.put("endDay", endDay);
		map.put("searchStatus", searchStatus);
		
		//  페이징 처리 시작
		Integer currentPage = (Integer)session.getAttribute("currentPage");
		
		if(currentPage == null) {
			currentPage = 1; // param이 비어있으면 현재페이지 = 첫페이지 
		}

		PagingVO paging = new PagingVO(currentPage, documentService.retrieveDocumentList(map).size());
		
		model.addAttribute("paging", paging);
		//  페이징 처리 끝
		
		model.addAttribute("status", status);
		model.addAttribute("myDocs", myDocs);
		model.addAttribute("documentList", documentService.retrieveDocumentList(map));
		
		return "jsonView";
		
	}
	
}