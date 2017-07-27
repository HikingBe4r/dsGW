package com.project.groupware.persistent.mapper;

import java.util.Map;

public interface QnAFileMapper {

	void insertArticleFile(Map<String, Object> map);
	
	void deleteArticleFile(int articleId);
	
	void deleteFile(int fileId);
	
}
