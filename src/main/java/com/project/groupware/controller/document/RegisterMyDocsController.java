package com.project.groupware.controller.document;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.BookMarkDocumentVO;
import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.service.DocumentService;

@Controller
public class RegisterMyDocsController {
	
	@Autowired
	private DocumentService documentService;
	
	@RequestMapping(value="/registerMyDocs.do", method=RequestMethod.GET)
	public ModelAndView registerMyDocs(
			@SessionAttribute(value="employee") EmployeeVO employee,
			@RequestParam(value="isBookmark", required=true) Integer isBookmark,
			@RequestParam(value="documentId", required=true) String documentId,
			@RequestParam(value="keyfield", required=false) String keyfield,
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="searchDay", required=false) String searchDay,
			@RequestParam(value="startDay", required=false, defaultValue="all") String startDay,
			@RequestParam(value="endDay", required=false, defaultValue="all") String endDay,
			@RequestParam(value="myDocs", required=false) String myDocs,
			@RequestParam(value="status", required=false) String status,
			@RequestParam(value="searchStatus", required=false) String searchStatus,
			@SessionAttribute(value="currentPage", required=false) Integer currentPage
			) {

		ModelAndView mv = new ModelAndView();
		
		// 즐겨찾기 추가/제거
		BookMarkDocumentVO bookmark = new BookMarkDocumentVO();
		
		bookmark.setEmployeeId(employee.getId());
		bookmark.setDocumentId(documentId);
		
		if(isBookmark == 0) {
			documentService.registerBookMarkDocument(bookmark);;
		} else {
			documentService.removeBookMarkDocument(bookmark);
		}		
		
		// 양식목록 조회
		mv.setViewName("redirect:/searchDocument.do");		
		
		// 테스트			
		mv.addObject("keyfield", keyfield);
		mv.addObject("keyword", keyword);
		mv.addObject("searchDay", searchDay);
		mv.addObject("startDay", startDay);
		mv.addObject("endDay", endDay);
		mv.addObject("myDocs", myDocs);
		mv.addObject("status", status);	
		mv.addObject("searchStatus", searchStatus);
		mv.addObject("currentPage", currentPage);
		
		return mv;
		
	}

}