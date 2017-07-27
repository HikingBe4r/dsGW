package com.project.groupware.persistent.mapper;

import com.project.groupware.domain.ArticleReplyVO;

public interface QnAReplyMapper {

	void insertReply(ArticleReplyVO articleReply);
	
	void updateReply(ArticleReplyVO articleReply);
	
	void deleteArticleReply(int articleId);
	
	void deleteReply(int replyId);
	
}

