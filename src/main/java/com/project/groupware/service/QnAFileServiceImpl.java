package com.project.groupware.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.groupware.persistent.mapper.QnAFileMapper;

@Service
public class QnAFileServiceImpl implements QnAFileService{

	@Autowired
	private QnAFileMapper qnaFileMapper;
	
	public void removeFile(int fileId) {
		qnaFileMapper.deleteFile(fileId);
		
	}

	public void removeArticleFile(int articleId) {
		qnaFileMapper.deleteArticleFile(articleId);
		
	}

	
	
}
