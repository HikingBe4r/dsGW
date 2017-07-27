package com.project.groupware.persistent.mapper;

import java.util.Map;

public interface ArticleFileMapper {

	//파일을 등록한다.
	public void insertArticleFile(Map<String, Object> map);
	
	//파일을 삭제한다.(파일)
	public void deleteFile(Map<String, Object> map);
	
	//파일을 삭제한다.(게시글)
	public void deleteArticleFile(int articleId);
}
