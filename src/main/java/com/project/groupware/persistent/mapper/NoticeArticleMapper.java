package com.project.groupware.persistent.mapper;

import java.util.List;
import java.util.Map;

import com.project.groupware.domain.ArticleVO;

public interface NoticeArticleMapper {
	// 게시글을 등록한다.
	void insertArticle(ArticleVO article);

	// 게시글 목록 조회하다.
	List<ArticleVO> selectArticleList(Map<String, Object> map);

	// 게시글을 검색하다
	List<ArticleVO> findArticleList(Map<String, Object> map);

	// 게시글 전체 갯수를 구하다
	int TotalPost(int boardId);

	// 게시글 상세 조회하다
	ArticleVO selectArticle(int id);

	// 게시글 정보를 수정하다.
	void updateArticle(ArticleVO article);

	// 게시글 삭제를 한다.
	void deleteArticle(int id);

	// 게시글 조회수
	void upHitcount(int id);

	// 게시글 이전
	ArticleVO prevArticle(Map<String, Object> map);

	// 게시글 다음
	ArticleVO nextArticle(Map<String, Object> map);
	
	
}
