package com.project.groupware.service;

import com.project.groupware.domain.ArticleReplyVO;

public interface QnAReplyService {

	void registerReply(ArticleReplyVO articleReply);
	
	void modifyReply(ArticleReplyVO articleReply);
	
	void removeArticleReply(int id);
	
	void removeReply(int replyId);
}
