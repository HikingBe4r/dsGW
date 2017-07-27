/*package com.project.groupware.controller.noticleArticle;

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
import com.project.groupware.service.NoticeArticleService;
import com.project.groupware.util.UploadFileUtils;

@Controller
public class RemoveArticleController {
	@Autowired
	private NoticeArticleService noticleArticleService;
	@Autowired
	private BoardService boardService;
	


	@RequestMapping(value="/removeArticle.do", method=RequestMethod.GET)
	public String submit(@RequestParam(value="boardId", required=true) int boardId,	// 게시판 번호
			             @RequestParam(value="id", required=true) int id) {    	    //게시글 번호
			
			
			ArticleVO article = noticleArticleService.retrieveArticle(id);
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
			noticleArticleService.removeArticle(id);
			boardService.retrieveBoardList();	
			return "redirect:/listArticle.do?boardId=" + article.getBoardId();
	}
}
*/