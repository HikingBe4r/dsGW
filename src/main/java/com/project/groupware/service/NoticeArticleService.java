package com.project.groupware.service;

import java.util.List;
import java.util.Map;

import com.project.groupware.domain.ArticleVO;

public interface NoticeArticleService {

	// 게시글 쓰기 서비스
	void registerArticle(ArticleVO article);

	// 게시글 목록 조회 서비스
	List<ArticleVO> retrieveArticleList(Map<String, Object> map);

	// 게시글 검색 서비스
	List<ArticleVO> searchArticleList(Map<String, Object> map);

	// 게시글 전체 갯수 서비스
	int retrieveTotalArticle(int boardId);

	// 게시글 상세 조회 서비스
	ArticleVO retrieveArticle(int id);

	// 게시글 수정 서비스
	void modifyArticle(ArticleVO article);

	// 게시글 삭제
	void removeArticle(int id);

	// 게시글 조회수
	void upHitcount(int id);

	// 게시글 이전
	ArticleVO prevArticle(Map<String, Object> map);

	// 게시글 다음
	ArticleVO nextArticle(Map<String, Object> map);
	
	
}
