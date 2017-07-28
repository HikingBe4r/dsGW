package com.project.groupware.service;

import java.util.List;
import java.util.Map;

import com.project.groupware.domain.ArticleVO;

public interface QnAService {
	
	//게시글 쓰기 서비스
		public void registerQnA(ArticleVO article);
		
		//게시글 목록 조회 서비스
		public List<ArticleVO> retrieveQnAList(Map<String, Object> map);
		
		//게시글 전체 갯수 서비스
		public int retrieveTotalQnA(int boardId);
		
		//게시글 상세 조회 서비스
		public ArticleVO retrieveQnA(int id);
		
		//게시글 조회수증가 서비스
		public void upHitcountQnA(int id);
		
		//게시글 수정 서비스
		public void modifyQnA(ArticleVO article);
		
		//게시글 삭제 서비스
		public void removeQnA(int id);	
		
		/*//내글을 조회하다
		public List<ArticleVO> myArticle(Map<String, Object> map);*/
		
		//게시글 삭제 서비스(여러개)
		public void removeQnAs(Map<String, Object> map);
}
