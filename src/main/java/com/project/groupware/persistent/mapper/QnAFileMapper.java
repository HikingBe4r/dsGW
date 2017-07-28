package com.project.groupware.persistent.mapper;

import java.util.Map;

public interface QnAFileMapper {

	void insertQnAFile(Map<String, Object> map);
			
	void deleteQnAFile(Map<String, Object> map);
	
	void deleteQnAArticleFile(int articleId);
	
}
