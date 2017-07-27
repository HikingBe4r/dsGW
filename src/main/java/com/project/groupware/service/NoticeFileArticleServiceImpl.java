package com.project.groupware.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.groupware.domain.ArticleVO;
import com.project.groupware.persistent.mapper.NoticeArticleFileMapper;

@Service
public class NoticeFileArticleServiceImpl implements NoticeFileArticleService {

	@Autowired
	private NoticeArticleFileMapper noticeArticleFileMapper;


	public void removeFileArticle(int id) {
		noticeArticleFileMapper.deleteFile(id);
		
	}


	









}
















