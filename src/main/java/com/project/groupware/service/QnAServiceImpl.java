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
	
	public void registerArticle(ArticleVO article) {
		qnaMapper.insertArticle(article);
		
		int articleId = article.getId();
		List<ArticleFileVO> articleFiles = article.getFiles();
		if(articleFiles.size() != 0){
			for(ArticleFileVO articleFile : articleFiles){
				articleFile.setArticleId(articleId);
			}
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("articleFiles", articleFiles);
			qnaFileMapper.insertArticleFile(map);
			
		}
	}
	
	public List<ArticleVO> retrieveArticleList(Map<String, Object> map) {
		return qnaMapper.selectArticleList(map);
		
	}

	public List<ArticleVO> searchArticle(Map<String, Object> map) {
		return qnaMapper.findArticleList(map);
	}

	public int retrieveTotalArticle(int boardId) {
		int count = qnaMapper.selectTotalArticle(boardId); 
		return count;
	}

	public ArticleVO retrieveArticle(int id) {
		return qnaMapper.selectArticle(id);
	}

	public void upHitcount(int articleId) {
		qnaMapper.upHitcount(articleId);
	}

	public void modifyArticle(ArticleVO article) {
		qnaMapper.updateArticle(article);
		
		int articleId = article.getId();
		List<ArticleFileVO> articleFiles = article.getFiles();
		if(articleFiles.size() != 0){
			for(ArticleFileVO articleFile : articleFiles){
				articleFile.setArticleId(articleId);
			}
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("articleFiles", articleFiles);
			qnaFileMapper.insertArticleFile(map);
		}
		
	}

	public void removeArticle(int id) {
		qnaFileMapper.deleteArticleFile(id);
		qnaReplyMapper.deleteArticleReply(id);
		qnaMapper.deleteArticle(id);
	}
		            
	
	
	
}
