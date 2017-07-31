package com.project.groupware.persistent.mapper;

import java.util.List;
import java.util.Map;

import com.project.groupware.domain.ArticleVO;

public interface NoticeArticleMapper {
	// 게시글을 등록한다.
	void insertNoticeArticle(ArticleVO article);

	// 게시글 목록 조회하다.
	List<ArticleVO> selectNoticeArticleList(Map<String, Object> map);

	// 게시글을 검색하다
	List<ArticleVO> findNoticeArticleList(Map<String, Object> map);

	// 게시글 전체 갯수를 구하다
	int TotalPostNotice(int boardId);

	// 게시글 상세 조회하다
	ArticleVO selectNoticeArticle(int id);

	// 게시글 정보를 수정하다.
	void updateNoticeArticle(ArticleVO article);

	// 게시글 삭제를 한다.
	void deleteNoticeArticle(int id);

	// 게시글 조회수
	void upHitcountNotice(int id);

	// 게시글 이전
	ArticleVO prevNoticeArticle(Map<String, Object> map);

	// 게시글 다음
	ArticleVO nextNoticeArticle(Map<String, Object> map);
	
	
}
