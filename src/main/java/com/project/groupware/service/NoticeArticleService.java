package com.project.groupware.service;

import java.util.List;
import java.util.Map;

import com.project.groupware.domain.ArticleVO;

public interface NoticeArticleService {

	// 게시글 쓰기 서비스
	void registerNoticeArticle(ArticleVO article);

	//게시글 목록 조회 서비스
		public List<ArticleVO> retrieveNoticeArticleList(Map<String, Object> map);

	// 게시글 검색 서비스
	List<ArticleVO> searchNoticeArticleList(Map<String, Object> map);

	// 게시글 전체 갯수 서비스
	int retrieveTotalNoticeArticle(int boardId);

	// 게시글 상세 조회 서비스
	ArticleVO retrieveNoticeArticle(int id);

	// 게시글 수정 서비스
	void modifyNoticeArticle(ArticleVO article);

	// 게시글 삭제
	void removeNoticeArticle(int id);

	// 게시글 조회수
	void upHitcountNotice(int id);

	// 게시글 이전
	ArticleVO prevNoticeArticle(Map<String, Object> map);

	// 게시글 다음
	ArticleVO nextNoticeArticle(Map<String, Object> map);
	
	
}
