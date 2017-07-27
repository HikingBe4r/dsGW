package com.project.groupware.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.groupware.domain.ArticleReplyVO;
import com.project.groupware.persistent.mapper.QnAReplyMapper;

@Service
public class QnAReplyServiceImpl implements QnAReplyService{

	@Autowired
	private QnAReplyMapper qnaReplyMapper;
	
	public void registerReply(ArticleReplyVO articleReply) {
		qnaReplyMapper.insertReply(articleReply);
		
	}
	
	public void modifyReply(ArticleReplyVO articleReply) {
		qnaReplyMapper.updateReply(articleReply);
		
	}

	public void removeArticleReply(int articleId) {
		qnaReplyMapper.deleteArticleReply(articleId);
		
	}

	public void removeReply(int replyId) {
		qnaReplyMapper.deleteReply(replyId);
		
	}
	
	
	
}
