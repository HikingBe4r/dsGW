package com.project.groupware.persistent.mapper;

import java.util.List;

import com.project.groupware.domain.ArticleReplyVO;

public interface QnAReplyMapper {

	//댓글 등록
	public void insertQnAReply(ArticleReplyVO articleReply);
	
	//댓글을 삭제한다.(게시글)
	public void deleteQnAArticleReply(int articleId);
	
	//댓글을 삭제한다.(댓글)
	public void deleteQnAReply(int id);
	
	//댓글을 수정한다.
	public void updateQnAReply(ArticleReplyVO articleReply);
	
	//댓글을 조회하다.
	public List<ArticleReplyVO>selectQnAReplyList(int articleId);
	
}

