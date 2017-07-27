package com.project.groupware.controller.article;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.service.ArticleService;
import com.project.groupware.service.BoardService;
import com.project.groupware.service.DepartmentService;

@Controller
public class MyArticleController {

	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private DepartmentService departmentService;
	

	
	@RequestMapping(value="/myArticle.do", method=RequestMethod.GET)
	public ModelAndView search(@SessionAttribute(value="employee") EmployeeVO employee,
			 @RequestParam(value="keytype", required=false)String keytype,
			 @RequestParam(value="keyword", required=false, defaultValue="all")String keyword,
			 @RequestParam(value="boardId", required=true) int boardId,
			 @RequestParam(value="secret", required=true) String secret,
			 @RequestParam(value="currentPage" , required=true) Integer  currentPage
			 )
				{
		return null;
		/*ModelAndView mv = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardId", boardId);
		map.put("keytype", keytype);
		map.put("keyword", keyword);
		map.put("employeeId", employee.getId());
		map.put("secret", secret);
		
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
		
		return mv;*/
	}
}
		
