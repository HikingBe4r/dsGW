package com.project.groupware.persistent.mapper;

import java.util.List;
import java.util.Map;

import com.project.groupware.domain.ArticleVO;

public interface QnAMapper {

	//게시글을 등록한다.
	public void insertQnA(ArticleVO article);
	
	//게시글 목록 조회하다.
	public List<ArticleVO> selectQnAList(Map<String, Object> map);
	
	//게시글 전체 갯수를 구하다
	public int totalQnA(int boardId);
	
	//게시글 상세 조회하다
	public ArticleVO selectQnA(Map<String, Object> map);
	
	//조회수를 증가시키다
	public void upHitcountQnA(int id);
	
	//게시글을 수정하다
	public void updateQnA(ArticleVO article);
	
	//게시글 을 삭제하다.
	public void deleteQnA(int id);
	
	//내글을 조회하다
	public List<ArticleVO> selectMyQnAList(Map<String, Object> map);

	//게시글을 삭제하다(여러개)
	public void deleteQnAs(int id);
}
