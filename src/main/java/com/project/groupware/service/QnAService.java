package com.project.groupware.service;

import java.util.List;
import java.util.Map;

import com.project.groupware.domain.ArticleVO;

public interface QnAService {
	
	void registerArticle(ArticleVO article);
	
	List<ArticleVO> retrieveArticleList(Map<String, Object> map);
	
	List<ArticleVO> searchArticle(Map<String, Object> map);
	
	int retrieveTotalArticle(int boardId);
	
	ArticleVO retrieveArticle(int id);
	
	void upHitcount(int articleId);
	
	void modifyArticle(ArticleVO article);
	
	void removeArticle(int articleId);
	
	//void removeAllArticle(Map<String, Object> map);
}
