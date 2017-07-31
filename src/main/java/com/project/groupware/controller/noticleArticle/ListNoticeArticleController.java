/*package com.project.groupware.controller.noticleArticle;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.AdminVO;
import com.project.groupware.domain.ArticleVO;
import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.domain.PagingVO;
import com.project.groupware.service.ArticleService;
import com.project.groupware.service.BoardService;
import com.project.groupware.service.DepartmentService;
import com.project.groupware.service.NoticeArticleService;

@Controller
public class ListNoticeArticleController {

	@Autowired
	private NoticeArticleService noticeArticleService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private DepartmentService departmentService;
	
	@RequestMapping(value="/listNoticeArticleForm.do", method=RequestMethod.GET)
	public ModelAndView listForm() {
		
		ModelAndView mv = new ModelAndView();
		
		//mv.addObject("departments",departmentService.retrieveDepartmentListID());
		mv.addObject("boards",boardService.retrieveBoardList());
		mv.setViewName("boardNavTest/noticleArticle/listArticle"); 
		return mv;
	}
	
	//게시글 검색 요청처리 컨트롤러
	@RequestMapping(value="/listNoticeArticle.do", method=RequestMethod.GET)
	public ModelAndView search(@RequestParam(value="keytype", required=false)String keytype,
						 @RequestParam(value="keyword", required=false, defaultValue="all")String keyword,
						 @RequestParam(value="boardId", required=true) int boardId,
						 @RequestParam(value="secret", required=true) int secret,
						 @RequestParam(value="departmentId", required=false) String departmentId ,
						 @RequestParam(value="currentPage" , required=true) Integer  currentPage,
						 HttpSession session) {
				

				ModelAndView mv = new ModelAndView();
		
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("boardId", boardId);
				map.put("keytype", keytype);
				map.put("keyword", keyword);
				map.put("secret", secret);
				
				EmployeeVO employee = (EmployeeVO)session.getAttribute("employee");					
				
				if(secret == 1) {  				//전체
					if(employee == null) {		//관리자인 경우
						mv.addObject("departments",departmentService.retrieveDepartmentListID());						
					}
				}
				
				if(secret == 0) {       				//부서별
					if(employee != null) { 				//사원인 경우					
						map.put("departmentId",employee.getDepartmentId());
					} else { 							//관리자인 경우
						map.put("departmentId", departmentId);						
					}
				}
											
				List<ArticleVO> articleList = noticeArticleService.retrieveNoticeArticleList(map);
						
				
				
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
		}*/