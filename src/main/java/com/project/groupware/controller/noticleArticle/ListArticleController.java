/*package com.project.groupware.controller.noticleArticle;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.ArticleVO;
import com.project.groupware.domain.PagingVO;
import com.project.groupware.service.ArticleService;
import com.project.groupware.service.BoardService;
import com.project.groupware.service.DepartmentService;
import com.project.groupware.service.NoticeArticleService;

@Controller
public class ListArticleController {

	
	@Autowired
	private NoticeArticleService noticeArticleService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private DepartmentService departmentService;

	// 리스트 보여주기
	@RequestMapping(value = "/listArticle.do", method = RequestMethod.GET)
	public ModelAndView listArticle(@RequestParam(value = "boardId") int boardId,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {

		PagingVO paging = new PagingVO();
		// 현재 페이지 번호를 구한다.
		paging.setCurrentPage(currentPage);

		// 전체 게시글 수를 구한다.
		paging.setTotalPost(noticeArticleService.retrieveTotalArticle(boardId));

		// 한 페이지에 보여줄 게시글 수를 설정한다.
		paging.setPostPerPage(10);
		// 한 페이지에 보여줄 페이지 목록 수를 설정한다.
		paging.setPageBlock(5);

		// 페이지 번호에 해당하는 게시글 목록을 조회하다.
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", paging.getStartRow());
		map.put("endRow", paging.getEndRow());
		map.put("boardId", boardId);

		ModelAndView mv = new ModelAndView();

		mv.addObject("departments", departmentService.retrieveDepartmentList(map));
		mv.addObject("boards", boardService.retrieveBoardList());
		mv.addObject("articles", noticeArticleService.retrieveArticleList(map));
		mv.addObject("paging", paging);
		mv.setViewName("boardNavTest/article/listArticle"); // boardNavTest/article/
		return mv;
	}

}*/