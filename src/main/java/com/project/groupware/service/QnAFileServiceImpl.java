package com.project.groupware.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.groupware.persistent.mapper.QnAFileMapper;

@Service
public class QnAFileServiceImpl implements QnAFileService{

	@Autowired
	private QnAFileMapper qnaFileMapper;

	public void registerQnAFile(Map<String, Object> map) {
		qnaFileMapper.insertQnAFile(map);
		
	}

	public void delteQnAFile(Map<String, Object> map) {
		qnaFileMapper.deleteQnAFile(map);
		
	}

	public void deleteQnAArticleFile(int articleId) {
		qnaFileMapper.deleteQnAArticleFile(articleId);
		
	}

	
	

	
	
}
