package com.project.groupware.controller.qnaArticle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.service.BoardService;
import com.project.groupware.service.QnAService;

@Controller
public class RemoveQnAController {

   @Autowired
   private QnAService qnaService;
   
   @Autowired
   private BoardService boardService;
   
   @RequestMapping(value="/removeQnA.do", method=RequestMethod.GET)
   public String submit(@SessionAttribute(value="employee") EmployeeVO employee,
		   			@RequestParam(value="id")int id,
                    @RequestParam(value="boardId")int boardId){
      
      qnaService.removeQnA(id);
      
      boardService.retrieveBoardList();
      
      return "redirect:/listNoticeArticleForm.do?boardId=314&secret=1";
   }
   
   
   @RequestMapping(value="/removeQnAList.do", method=RequestMethod.GET)
   public String submit(
		   			 @RequestParam(value="checkList") String checkList,
                     @RequestParam(value="boardId")int boardId){
      
	   
      
	   if(!checkList.isEmpty()){
		   String[] list = checkList.split(",");
		   for(int i=0; i<list.length; i++){
			   qnaService.removeQnA(Integer.parseInt(list[i]));
		   }
	   }
      
      //�޴� ����Ʈ
      boardService.retrieveBoardList();
      
      return "redirect:/listArticleForm.do?boardId=" + boardId+"&secret=1";
   }
}