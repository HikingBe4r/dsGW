package com.project.groupware.controller.noticleArticle;
/*package com.project.groupware.controller.noticleArticle;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.ArticleFileVO;
import com.project.groupware.domain.ArticleImageVO;
import com.project.groupware.domain.ArticleVO;
import com.project.groupware.domain.BoardVO;
import com.project.groupware.service.BoardService;
import com.project.groupware.service.NoticeArticleService;
import com.project.groupware.service.NoticeFileArticleService;
import com.project.groupware.service.NoticeImageArticleService;
import com.project.groupware.util.UploadFileUtils2;

@Controller
public class ModifyArticleController {
	@Autowired
	private NoticeArticleService noticeArticleService;
	@Autowired
	private NoticeFileArticleService noticeFileArticleService;
	@Autowired
	private NoticeImageArticleService noticeImageArticleService;
	@Autowired
	private BoardService boardService;

	// 게시글 수정 폼 요청 처리 컨트롤러 메소드
	@RequestMapping(value = "/modifyNoticeArticle.do", method = RequestMethod.GET)
	public ModelAndView form(@RequestParam(value = "id", required = true) int id) {

		List<BoardVO> boards = boardService.retrieveBoardList();		
		ModelAndView mv = new ModelAndView();
		mv.addObject("boards", boards);
		mv.addObject("article", noticeArticleService.retrieveArticle(id));
		
		mv.setViewName("boardNavTest/noticleArticle/modifyArticleForm");
		return mv;
	}

	// 게시글 수정 요청 처리 컨트롤러 메소드
	@RequestMapping(value = "/modifyNoticeArticle.do", method = RequestMethod.POST)
	public String submit(@ModelAttribute(value = "article") ArticleVO article,
			@RequestParam(value = "fileId", required = false, defaultValue = "") String fileId,
			@RequestParam(value = "imageId", required = false, defaultValue = "") String imageId,
			HttpServletRequest request) throws Exception {

		System.out.println("fileId : " + fileId);
		System.out.println("imageId : " + imageId);
		//일반 파일 첨부한 경우
		List<MultipartFile> files = article.getUpload();

		for (MultipartFile file : files) {
			if (!file.isEmpty()) {
				ArticleFileVO articleFile = UploadFileUtils2.uploadFile(file, request);
				articleFile.setArticleId(article.getId());
				article.addArticleFile(articleFile);
			}
		}
		
		
		//이미지 파일 첨부한 경우
		MultipartFile files1 = article.getImgUpload();
		if ((files1 != null) &&  (!files1.isEmpty())) {
			System.out.println("call 이미지 파일 첨부");
			ArticleImageVO articleImage = UploadFileUtils2.uploadFile1(files1, request);
			articleImage.setArticleId(article.getId());
			article.addArticleImage(articleImage);
		}

		
		//일반 파일을  삭제한 경우
		if (!fileId.equals("")) {
			String[] temp = fileId.split(",");
			for (int i = 0; i < temp.length; i++) {
				int num = Integer.parseInt(temp[i]);
				noticeFileArticleService.removeFileArticle(num);
			}
		}
		
		//이미지 파일울 삭제한 경우
		if (!imageId.equals("")) {
			System.out.println("call 이미지 파일 삭제");
			String[] temp1 = imageId.split(",");
			for (int i = 0; i < temp1.length; i++) {
				int num1 = Integer.parseInt(temp1[i]);
				noticeImageArticleService.removeImageArticle(num1);
			}

		}

		noticeArticleService.modifyArticle(article);
		boardService.retrieveBoardList();

		return "redirect:/detailNoticeArticle.do?id=" + article.getId();

	}
}
*/