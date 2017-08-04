package com.project.groupware.controller.article;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.groupware.service.ArticleService;
import com.project.groupware.service.BoardService;
import com.project.groupware.service.DepartmentService;

@Controller
public class RemoveArticleController {

	@Autowired
	private ArticleService articleService;

	@Autowired
	private BoardService boardService;

	@Autowired
	private DepartmentService departmentService;

	// 게시글 삭제 요청 처리 컨트롤러 메소드
	@RequestMapping(value = "/removeArticle.do", method = RequestMethod.GET)
	public String submit(@RequestParam(value = "id", required = false) int id, 
						 @RequestParam(value = "boardId") String boardId,
						 Model model) {		
		articleService.removeArticle(id);

		model.addAttribute("boards", boardService.retrieveBoardList());
		model.addAttribute("departments", departmentService.retrieveDepartmentListID());

		return "redirect:/listNoticeArticleForm.do?boardId=" + boardId+"&secret=0";
	}

	@RequestMapping(value = "/removeArticleList.do", method = RequestMethod.GET)
	public String submit(
			@RequestParam(value = "articleIdList") String articleIdList,
			@RequestParam(value = "boardId") int boardId) {
	
		if (!articleIdList.isEmpty()) {
			String[] list = articleIdList.split(",");
			for (int i = 0; i < list.length; i++) {
				System.out.println("삭제 리스트"+list[i]);
				articleService.removeArticle(Integer.parseInt(list[i]));
			}
		}

		// 메뉴 리스트
		boardService.retrieveBoardList();
		departmentService.retrieveDepartmentListID();
		return "redirect:/listArticleForm.do?boardId=" + boardId+"&secret=0";
	}

}
