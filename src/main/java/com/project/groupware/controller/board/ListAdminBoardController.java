package com.project.groupware.controller.board;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.ArticleVO;
import com.project.groupware.domain.BoardVO;
import com.project.groupware.domain.PagingVO;
import com.project.groupware.service.BoardService;

@Controller
public class ListAdminBoardController {

	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="/listBoardAdminForm.do", method=RequestMethod.GET)
	public ModelAndView listForm() {
		
		ModelAndView mv = new ModelAndView();
		
		
		mv.setViewName("adminNav/board/listAdmin"); 
		return mv;
	}
	

	//관리자게시판 리스트 보여주기
	@RequestMapping(value="/listBoardAdmin.do", method=RequestMethod.GET)
	public ModelAndView listAdmin(@RequestParam(value="currentPage" , required=true) Integer  currentPage)  {
		
		List<BoardVO> boardList = boardService.retrieveBoardList();

		PagingVO paging = new PagingVO(currentPage, boardList.size());
		
		if(currentPage == null) {
			currentPage = 1; // param이 비어있으면 현재페이지 = 첫페이지 
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("paging", paging);
		mv.addObject("boardList", boardList);
		mv.setViewName("jsonView");
		return mv;
	}
	
}
