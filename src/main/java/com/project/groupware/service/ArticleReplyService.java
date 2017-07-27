package com.project.groupware.service;

import java.util.List;
import java.util.Map;

import com.project.groupware.domain.ArticleReplyVO;
import com.project.groupware.domain.ArticleVO;

public interface ArticleReplyService {

	
	//댓글 등록 서비스
	public void registerReply(ArticleReplyVO articleReply);
	
	//댓글 삭제
	public void removeReply(int id);
	
	//댓글 수정
	public void modifyReply(ArticleReplyVO articleReply);
	
	//댓글 조회
	public List<ArticleReplyVO> retrieveReply(int articleId);
}
