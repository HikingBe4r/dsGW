package com.project.groupware.controller.form;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.BookmarkFormVO;
import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.service.FormService;

@Controller
public class RegisterBookmarkFormController {
	
	@Autowired
	private FormService formService;
	
	@RequestMapping(value="/registerBookmarkForm.do", method=RequestMethod.POST)
	public ModelAndView registerBookmarkFormController(
			@SessionAttribute(value="employee") EmployeeVO employee,
			@RequestParam(value="isBookmark", required=true) Integer isBookmark,
			@RequestParam(value="formId", required=true) String formId,
			@RequestParam(value="keytype", required=true) String keytype,
			@RequestParam(value="keyword", required=true) String keyword,
			@RequestParam(value="boardId", required=true) String boardId,	//1: 전체양식조회, 2:즐겨찾기 양식조회
			@RequestParam(value="currentPage", required=true) Integer currentPage
			) {
		
		ModelAndView mv = new ModelAndView();
		
		
		// 즐겨찾기 추가/제거
		BookmarkFormVO bookmark = new BookmarkFormVO();
		
		bookmark.setEmployeeId(employee.getId());
		bookmark.setFormId(formId);
		
		if(isBookmark == 0) {
			formService.registerBookmarkForm(bookmark);
		} else {
			formService.removeBookmarkForm(bookmark);
		}
		
		
		// 양식목록 조회
		mv.setViewName("redirect:/searchForm.do");
		
		// 테스트
		mv.addObject("keytype", keytype);
		mv.addObject("keyword", keyword);
		mv.addObject("boardId", boardId);
		mv.addObject("currentPage", currentPage);
		
		return mv;
	}
}
