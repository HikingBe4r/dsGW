package com.project.groupware.persistent.mapper;

import java.util.List;
import java.util.Map;

import com.project.groupware.domain.ArticleVO;

public interface QnAMapper {

	void insertArticle(ArticleVO article);
	
	List<ArticleVO> selectArticleList(Map<String, Object> map);
	
	List<ArticleVO> findArticleList(Map<String, Object> map);
	
	int selectTotalArticle(int boardId);
	
	ArticleVO selectArticle(int id);
	
	void upHitcount(int articleId);
	
	void updateArticle(ArticleVO article);
	
	void deleteArticle(int articleId);
	
	//void deleteAllArticle(Map<String, Object> map);
}
