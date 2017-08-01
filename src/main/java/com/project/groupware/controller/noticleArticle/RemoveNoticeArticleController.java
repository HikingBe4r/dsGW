package com.project.groupware.controller.noticleArticle;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.groupware.domain.ArticleFileVO;
import com.project.groupware.domain.ArticleImageVO;
import com.project.groupware.domain.ArticleVO;
import com.project.groupware.service.BoardService;
import com.project.groupware.service.DepartmentService;
import com.project.groupware.service.NoticeArticleService;
import com.project.groupware.util.UploadFileUtils;

@Controller
public class RemoveNoticeArticleController {
	@Autowired
	private NoticeArticleService noticleArticleService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private DepartmentService departmentService;



	@RequestMapping(value="/removeNoticeArticle.do", method=RequestMethod.GET)
	public String submit(@RequestParam(value="boardId", required=true) int boardId,	// 게시판 번호
			             @RequestParam(value="id", required=true) int id) {    	    //게시글 번호

			
			ArticleVO article = noticleArticleService.retrieveNoticeArticle(id);
			List<ArticleFileVO> files = article.getFiles();			
			if(!files.isEmpty()) {
				File file = null;
				for(ArticleFileVO temp : files) {
					file = new File(UploadFileUtils.UPLOAD_PATH + File.separator + temp.getSystemFileName());
					if(file.exists()) {
						file.delete();
					}
				}
			}
			List<ArticleImageVO> image = article.getImage();			
			if(!image.isEmpty()) {
				File img = null;
				for(ArticleImageVO temp : image) {
					img = new File(UploadFileUtils.UPLOAD_PATH + File.separator + temp.getSystemImageName());
					if(img.exists()) {
						img.delete();
					}
				}
			}
			System.out.println("1231231"+ boardId);
			noticleArticleService.removeNoticeArticle(id);
			boardService.retrieveBoardList();	
			return "redirect:/listNoticeArticle.do?boardId=" + article.getBoardId();
	}
	
	

	@RequestMapping(value = "/removeNoticeArticleList.do", method=RequestMethod.GET)
	public String submit(
			@RequestParam(value = "articleIdList") String articleIdList,
			@RequestParam(value = "boardId") int boardId) {
	
		if (!articleIdList.isEmpty()) {
			String[] list = articleIdList.split(",");
			for (int i = 0; i < list.length; i++) {
				System.out.println("삭제 리스트"+list[i]);
				noticleArticleService.removeNoticeArticle(Integer.parseInt(list[i]));
			}
		}

		// 메뉴 리스트
		boardService.retrieveBoardList();
		departmentService.retrieveDepartmentListID();
		return "redirect:/listNoticeArticleForm.do?boardId=" + boardId+"&secret=0";
	}

}

