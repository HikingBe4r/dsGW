package com.project.groupware.persistent.mapper;

import java.util.List;
import java.util.Map;

import com.project.groupware.domain.ArticleVO;

public interface ArticleMapper {

	//게시글을 등록한다.
	public void insertArticle(ArticleVO article);
	
	//게시글 목록 조회하다.
	public List<ArticleVO> selectArticleList(Map<String, Object> map);
	
	//게시글 전체 갯수를 구하다
	public int TotalPost(int boardId);
	
	//게시글 상세 조회하다
	public ArticleVO selectArticle(int id);
	
	//조회수를 증가시키다
	public void upHitcount(int id);
	
	//게시글을 수정하다
	public void updateArticle(ArticleVO article);
	
	//게시글 을 삭제하다.
	public void deleteArticle(int id);
	
	/*//내글을 조회하다
	public List<ArticleVO> findmyArticle(Map<String, Object> map);
*/
	//게시글을 삭제하다(여러개)
	public void deleteArticles(Map<String, Object> map);
}
