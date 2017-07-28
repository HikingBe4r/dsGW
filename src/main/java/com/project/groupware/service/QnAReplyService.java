package com.project.groupware.service;

import java.util.List;

import com.project.groupware.domain.ArticleReplyVO;

public interface QnAReplyService {

	//댓글 등록 서비스
		public void registerQnAReply(ArticleReplyVO articleReply);
		
		//댓글 삭제
		public void removeQnAReply(int id);
		
		//댓글 수정
		public void modifyQnAReply(ArticleReplyVO articleReply);
		
		//댓글 조회
		public List<ArticleReplyVO> retrieveQnAReply(int articleId);
}
