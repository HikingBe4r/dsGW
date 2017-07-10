/*package com.project.groupware.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.groupware.domain.ArticleFileVO;
import com.project.groupware.domain.ArticleVO;
import com.project.groupware.persistent.mapper.ArticleFileMapper;
import com.project.groupware.persistent.mapper.ArticleMapper;

public class QnAServiceImpl implements ArticleService {
	@Autowired
	private ArticleMapper articleMapper;
	@Autowired
	private ArticleFileMapper articleFileMapper;
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.DEFAULT, readOnly=false, timeout=-1)
	public void registerArticle(ArticleVO article) {
		QnAMapper.insertArticle(article);
		
		int articleNo = article.getNo();
		List<ArticleFileVO> articleFiles = article.getFiles();
		if (articleFiles.size() != 0) {
			for (ArticleFileVO articleFile : articleFiles) {
				articleFile.setArticleNo(articleNo);
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("articleFiles", articleFiles);
			articleFileMapper.insertArticleFile(map);
		}
	}

}*/
