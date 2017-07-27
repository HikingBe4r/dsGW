package com.project.groupware.persistent.mapper;

import java.util.Map;


public interface NoticeArticleFileMapper {
	//파일을 등록한다.
		void insertArticleFile(Map<String, Object> map);		
	//파일 삭제한다.
		void deleteArticleFile(int articleId);
		
		void deleteFile(int fileId);
}
