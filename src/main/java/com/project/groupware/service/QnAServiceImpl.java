package com.project.groupware.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.groupware.domain.ArticleFileVO;
import com.project.groupware.domain.ArticleVO;
import com.project.groupware.persistent.mapper.QnAFileMapper;
import com.project.groupware.persistent.mapper.QnAMapper;
import com.project.groupware.persistent.mapper.QnAReplyMapper;

@Service
public class QnAServiceImpl implements QnAService{

	@Autowired
	private QnAMapper qnaMapper;
	@Autowired
	private QnAFileMapper qnaFileMapper;
	@Autowired
	private QnAReplyMapper qnaReplyMapper;
	
	public void registerQnA(ArticleVO article) {
		qnaMapper.insertQnA(article);
		
		int articleId = article.getId();
		List<ArticleFileVO> articleFiles = article.getFiles();
		if(articleFiles.size() != 0){
			for(ArticleFileVO articleFile : articleFiles){
				articleFile.setArticleId(articleId);
			}
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("articleFiles", articleFiles);
			qnaFileMapper.insertQnAFile(map);
			
		}
	}
	
	//게시글 목록조회
		public List<ArticleVO> retrieveQnAList(Map<String, Object> map) {
			return qnaMapper.selectQnAList(map);
		}

		//전체 게시글 구하기
		public int retrieveTotalQnA(int boardId) {
			int count = qnaMapper.totalQnA(boardId);
			return count;
		}
		
		//게시글 상세조회
		public ArticleVO retrieveQnA(int id) {
			return qnaMapper.selectQnA(id);
		}

		//조회수 증가
		public void upHitcountQnA(int id) {
			qnaMapper.upHitcountQnA(id);
			
		}
		
		//게시글 수정
		public void modifyQnA(ArticleVO article) {
			qnaMapper.updateQnA(article);
					//게시글 번호를 구한다.
					int articleId = article.getId();
					List<ArticleFileVO> articleFiles = article.getFiles();
					if(articleFiles.size() != 0) {
						for (ArticleFileVO articleFile : articleFiles) {
							articleFile.setArticleId(articleId);
						}
						Map<String, Object> map = new HashMap<String, Object>();
						map.put("articleFiles", articleFiles);
						qnaFileMapper.insertQnAFile(map);
						
					}
					
					//파일 번호를 구한다
					String fileNo = article.getFileNo();
					String[] temp = fileNo.split(",");
					
						
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("fileNoList",temp);
						
					qnaFileMapper.deleteQnAFile(map);

					
		}
		
		//게시글 삭제
		public void removeQnA(int id) {
			qnaFileMapper.deleteQnAArticleFile(id);
			qnaReplyMapper.deleteQnAReply(id);
			qnaMapper.deleteQnA(id);
		}

		/*//내글을 조회하다
		public List<ArticleVO> myArticle(Map<String, Object> map) {
			return articleMapper.findmyArticle(map);
		}*/
		
		
		//게시글을 삭제하다(여러개)
		public void removeQnAs(Map<String, Object> map) {
			qnaMapper.deleteQnAs(map);
			
			
		}
		            
	
	
	
}
