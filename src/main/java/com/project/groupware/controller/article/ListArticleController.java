package com.project.groupware.controller.article;

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

import com.project.groupware.domain.ArticleVO;

import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.domain.PagingVO;

import com.project.groupware.service.ArticleService;
import com.project.groupware.service.BoardService;
import com.project.groupware.service.DepartmentService;

@Controller
public class ListArticleController {

	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private DepartmentService departmentService;
	
	@RequestMapping(value="/listArticleForm.do", method=RequestMethod.GET)
	public ModelAndView listForm() {
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("departments",departmentService.retrieveDepartmentListID());
		mv.addObject("boards",boardService.retrieveBoardList());
		mv.setViewName("boardNavTest/article/listArticle"); 
		return mv;
	}
	
	//게시글 검색 요청처리 컨트롤러
	@RequestMapping(value="/listArticle.do", method=RequestMethod.GET)
	public ModelAndView search(@SessionAttribute(value="employee", required=false) EmployeeVO employee,
						 @RequestParam(value="keytype", required=false)String keytype,
						 @RequestParam(value="keyword", required=false, defaultValue="all")String keyword,
						 @RequestParam(value="boardId", required=true) int boardId,
						 @RequestParam(value="secret", required=true) String secret, 
						 @RequestParam(value="currentPage" , required=true) Integer  currentPage
						
						
						 ){
				ModelAndView mv = new ModelAndView();
		
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("boardId", boardId);
				map.put("keytype", keytype);
				map.put("keyword", keyword);
				map.put("secret", secret);
				if(employee != null) 
				{
					map.put("departmentId",employee.getDepartmentId());
				}
				
				
				List<ArticleVO> tempFormList = articleService.retrieveArticleList(map);
				List<ArticleVO> articleList = new ArrayList<ArticleVO>();
				
				articleList = tempFormList;
				
				if(currentPage == null) {
					currentPage = 1; // param이 비어있으면 현재페이지 = 첫페이지 
				}

				PagingVO paging = new PagingVO(currentPage, articleList.size());
						
				mv.addObject("paging", paging);
				//  페이징 처리 끝
				mv.addObject("articleList", articleList);
				
				
				mv.setViewName("jsonView");
				
				return mv;
			}
		}
				
