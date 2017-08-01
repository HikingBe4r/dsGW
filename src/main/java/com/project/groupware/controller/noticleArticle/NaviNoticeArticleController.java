package com.project.groupware.controller.noticleArticle;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.ArticleVO;
import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.service.BoardService;
import com.project.groupware.service.NoticeArticleService;

@Controller
public class NaviNoticeArticleController {
	@Autowired
	private NoticeArticleService noticleArticleService;
	@Autowired
	private BoardService boardService;


	@RequestMapping(value="/naviDetailNoticeArticle.do", method=RequestMethod.GET)
	public ModelAndView submit(@RequestParam(value="id", required=true) int id, 
			            @RequestParam(value="navi", required=true) String navi,
			            @RequestParam(value = "boardId") int boardId,
			            @RequestParam(value = "open") int open,
			            HttpSession session) {
			            			
			
			ModelAndView mv = new ModelAndView();
	      
			Map<String, Object> map = new HashMap<String, Object>();			
			map.put("id",id);
			map.put("boardId",boardId);
			map.put("secret",open);		
			
			if(open == 0) {  //부서
				EmployeeVO employee = (EmployeeVO)session.getAttribute("employee");
				String departmentId = null;
				if(employee != null) {
					System.out.println(employee);
					departmentId = employee.getDepartmentId();
					map.put("departmentId", departmentId);	
					System.out.println("departmentId : " + departmentId);
				} 
			}
				
			
			ArticleVO article = null;
			if(navi.equals("prev")) {
				article= noticleArticleService.prevNoticeArticle(map);				
			} else if(navi.equals("next")){				
				article = noticleArticleService.nextNoticeArticle(map);
			}
			
			if(article == null) {
				article = noticleArticleService.retrieveNoticeArticle(id);
			}
			
			mv.addObject("article", article);			
			mv.addObject("boards", boardService.retrieveBoardList());
		    
			mv.setViewName("boardNavTest/noticleArticle/detailArticle");		
			
			return mv;			
	}
}


