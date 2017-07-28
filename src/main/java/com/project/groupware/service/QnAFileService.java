package com.project.groupware.service;

import java.util.Map;

public interface QnAFileService {

	void registerQnAFile(Map<String, Object> map);
	
	void delteQnAFile(Map<String, Object> map);
	
	void deleteQnAArticleFile(int articleId);
	
}
