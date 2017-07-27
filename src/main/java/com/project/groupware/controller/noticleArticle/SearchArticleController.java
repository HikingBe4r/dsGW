/*package com.project.groupware.controller.noticleArticle;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.ArticleVO;
import com.project.groupware.domain.BoardVO;
import com.project.groupware.domain.PagingVO;
import com.project.groupware.service.ArticleService;
import com.project.groupware.service.BoardService;
import com.project.groupware.service.DepartmentService;
import com.project.groupware.service.NoticeArticleService;

@Controller
public class SearchArticleController {

	@Autowired
	private NoticeArticleService noticeArticleService;

	@Autowired
	private BoardService boardService;

	@Autowired
	private DepartmentService departmentService;

	@RequestMapping(value = "/searchArticle.do", method = RequestMethod.GET)
	public ModelAndView search(@RequestParam(value = "keyfield", required = false) String keyfield,
			@RequestParam(value = "keyword", required = false, defaultValue = "all") String keyword,
			@RequestParam(value = "boardId") int boardId,
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
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		map.put("boardId", boardId);
		map.put("startRow", paging.getStartRow());
		map.put("endRow", paging.getEndRow());

		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("boardId", boardId);
		map2.put("startRow", paging.getStartRow());
		map2.put("endRow", paging.getEndRow());

		ModelAndView mv = new ModelAndView();

		List<ArticleVO> articles = null;
		if (keyword.equals("all")) {
			articles = noticeArticleService.retrieveArticleList(map2);
		} else {
			articles = noticeArticleService.searchArticleList(map);			
		}
		
		mv.addObject("articles", articles);
		mv.addObject("departments", departmentService.retrieveDepartmentList(map2));
		mv.addObject("boards", boardService.retrieveBoardList());
		mv.addObject("paging", paging);

		mv.setViewName("boardNavTest/article/listArticle");

		return mv;

	}

}*/