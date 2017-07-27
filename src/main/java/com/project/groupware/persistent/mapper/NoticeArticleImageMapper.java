package com.project.groupware.persistent.mapper;

import java.util.List;
import java.util.Map;

import com.project.groupware.domain.ArticleVO;




public interface NoticeArticleImageMapper {
	//파일을 등록한다.
		void insertArticleImage(Map<String, Object> map);
	
	//이미지 삭제한다
		void deleteArticleImage(int articleId);
		
		void deleteImage(int imageId);
}	
