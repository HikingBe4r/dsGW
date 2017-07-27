package com.project.groupware.persistent.mapper;

import java.util.List;
import java.util.Map;

import com.project.groupware.domain.ArticleReplyVO;
import com.project.groupware.domain.ArticleVO;

public interface ArticleReplyMapper {

	//댓글 등록
	public void insertArticleReply(ArticleReplyVO articleReply);
	
	//댓글을 삭제한다.(게시글)
	public void deleteArticleReply(int articleId);
	
	//댓글을 삭제한다.(댓글)
	public void deleteReply(int id);
	
	//댓글을 수정한다.
	public void updateReply(ArticleReplyVO articleReply);
	
	//댓글을 조회하다.
	public List<ArticleReplyVO>selectReplyList(int articleId);
	
	
}
