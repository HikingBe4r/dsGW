package com.project.groupware.controller.form;

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

import com.project.groupware.domain.BookmarkFormVO;
import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.domain.FormVO;
import com.project.groupware.domain.PagingVO;
import com.project.groupware.service.FormService;

@Controller
public class ListFormController {
	
	@Autowired
	private FormService formService;
	
	@RequestMapping(value="/listForm.do", method=RequestMethod.GET)
	public String listForm() {
		return "approvalNav/form/listForm";
	}
	
	@RequestMapping(value="/searchForm.do", method=RequestMethod.GET)
	public ModelAndView searchForm(
			@SessionAttribute(value="employee") EmployeeVO employee,
			@RequestParam(value="keytype", required=true) String keytype,
			@RequestParam(value="keyword", required=true) String keyword,
			@RequestParam(value="boardId", required=true) String boardId,	//1: 전체양식조회, 2:즐겨찾기 양식조회
			@RequestParam(value="currentPage", required=true) Integer currentPage
			) {
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardId", boardId);
		
		List<FormVO> tempFormList = formService.retrieveFormList(map);
		List<FormVO> formList = new ArrayList<FormVO>();
		
		List<BookmarkFormVO> bookmarkFormList = formService.retrieveBookmarkFormList(employee.getId());
		List<Integer> isBookmark = new ArrayList<Integer>(); // 각 양식이 북마크된건지.
		
		// 전체 양식조회이면 formList = tempformList
		if(boardId.equals("1")) {
			formList = tempFormList;
		}
		// boardId = 2이면 (즐겨찾기 양식 조회) formList에 즐겨찾기만 추가.
		else if(boardId.equals("2")) {
			for(FormVO form: tempFormList) {
				for(BookmarkFormVO bookmark: bookmarkFormList) {
					if(form.getId().equals(bookmark.getFormId())){
						// 즐겨찾기 양식조회이면 즐겨찾기 인 것만 추가. 
						formList.add(form);
					}
				}
			}
		}
		
		// 조회한 리스트의 즐겨찾기 상태 입력
		for(FormVO form: formList) {
			int test = 0;
			for(BookmarkFormVO bookmark: bookmarkFormList) {
				if(form.getId().equals(bookmark.getFormId())){
					test++;
				}
			}
			if(test > 0) {
				isBookmark.add(1);				
			} else {
				isBookmark.add(0);
			}
		}
		
		//  페이징 처리 시작
		if(currentPage == null) {
			currentPage = 1; // param이 비어있으면 현재페이지 = 첫페이지 
		}

		PagingVO paging = new PagingVO(currentPage, formList.size());
				
		mv.addObject("paging", paging);
		//  페이징 처리 끝
		mv.addObject("formList", formList);
		mv.addObject("isBookmark", isBookmark);
		mv.setViewName("jsonView");
		
		return mv;
	}
}
