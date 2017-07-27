package com.project.groupware.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.groupware.domain.ArticleReplyVO;
import com.project.groupware.domain.ArticleVO;
import com.project.groupware.persistent.mapper.ArticleReplyMapper;

@Service
public class ArticleReplyServiceImpl implements ArticleReplyService{

	@Autowired
	private ArticleReplyMapper articleReplyMapper;
	
	public void registerReply(ArticleReplyVO articleReply) {
		articleReplyMapper.insertArticleReply(articleReply);
	}

	public void removeReply(int id) {
		articleReplyMapper.deleteReply(id);
	}

	public void modifyReply(ArticleReplyVO articleReply) {
		articleReplyMapper.updateReply(articleReply);
	}

	public List<ArticleReplyVO> retrieveReply(int articleId) {
		return articleReplyMapper.selectReplyList(articleId);
	}

	
	
}
