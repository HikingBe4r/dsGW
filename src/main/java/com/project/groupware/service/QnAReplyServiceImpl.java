package com.project.groupware.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.groupware.domain.ArticleReplyVO;
import com.project.groupware.persistent.mapper.QnAReplyMapper;

@Service
public class QnAReplyServiceImpl implements QnAReplyService{

	@Autowired
	private QnAReplyMapper qnaReplyMapper;

	public void registerQnAReply(ArticleReplyVO articleReply) {
		qnaReplyMapper.insertQnAReply(articleReply);
		
	}

	public void removeQnAReply(int id) {
		qnaReplyMapper.deleteQnAReply(id);
		
	}

	public void modifyQnAReply(ArticleReplyVO articleReply) {
		qnaReplyMapper.updateQnAReply(articleReply);
		
	}

	public List<ArticleReplyVO> retrieveQnAReply(int articleId) {
		return qnaReplyMapper.selectQnAReplyList(articleId);
	}
	

	
	
	
}
