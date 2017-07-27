package com.project.groupware.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.groupware.domain.ArticleFileVO;
import com.project.groupware.domain.ArticleImageVO;
import com.project.groupware.domain.ArticleVO;
import com.project.groupware.persistent.mapper.NoticeArticleFileMapper;
import com.project.groupware.persistent.mapper.NoticeArticleImageMapper;
import com.project.groupware.persistent.mapper.NoticeArticleMapper;

@Service
public class NoticeImageArticleServiceImpl implements NoticeImageArticleService{
	
	@Autowired
	private NoticeArticleImageMapper noticeArticleImageMapper;


	public void removeImageArticle(int id) {
		noticeArticleImageMapper.deleteImage(id);
		
	}

}
















