package com.project.groupware.controller.notice;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.domain.NoticeVO;
import com.project.groupware.domain.PagingVO;
import com.project.groupware.service.EmployeeService;

@Controller
public class IsReadNoticeController {
	@Autowired
	private EmployeeService service;

	@RequestMapping(value = "/isReadNotice.do", method = RequestMethod.GET)
	public ModelAndView isReadNotice(@RequestParam(value = "id") String id,
			@RequestParam(value = "currentPage") Integer currentPage, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		service.isReadNotice(id);//읽었다고 체크
		EmployeeVO emp = new EmployeeVO();
		emp = (EmployeeVO) session.getAttribute("employee");
		List<NoticeVO> list = service.retrieveNoticeList(emp.getId());
		// 페이징 처리 시작
		if (currentPage == null) {
			currentPage = 1; // param이 비어있으면 현재페이지 = 첫페이지
		}

		PagingVO paging = new PagingVO(currentPage, list.size());

		mv.addObject("paging", paging);
		// 페이징 처리 끝

		mv.addObject("noticeList", list);
		mv.setViewName("approvalNav/notice/listNotice");
		return mv;
	}

}
