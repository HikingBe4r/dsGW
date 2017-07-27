package com.project.groupware.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.groupware.domain.ArticleFileVO;
import com.project.groupware.domain.ArticleVO;
import com.project.groupware.persistent.mapper.ArticleFileMapper;
import com.project.groupware.persistent.mapper.ArticleMapper;
import com.project.groupware.persistent.mapper.ArticleReplyMapper;


@Service
public class ArticleServiceImpl implements ArticleService {

	@Autowired
	private ArticleMapper articleMapper;
	@Autowired
	private ArticleFileMapper articleFileMapper;
	@Autowired
	private ArticleReplyMapper articleReplyMapper;
	
	//게시글 등록
	public void registerArticle(ArticleVO article) {
		articleMapper.insertArticle(article);
		//게시글 번호를 구한다.
		int articleId = article.getId();
		List<ArticleFileVO> articleFiles = article.getFiles();
		if(articleFiles.size() != 0) {
			for (ArticleFileVO articleFile : articleFiles) {
				articleFile.setArticleId(articleId);
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("articleFiles", articleFiles);
			articleFileMapper.insertArticleFile(map);
		}
		
	}

	//게시글 목록조회
	public List<ArticleVO> retrieveArticleList(Map<String, Object> map) {
		return articleMapper.selectArticleList(map);
	}

	//전체 게시글 구하기
	public int retrieveTotalArticle(int boardId) {
		int count = articleMapper.TotalPost(boardId);
		return count;
	}
	
	//게시글 상세조회
	public ArticleVO retrieveArticle(int id) {
		return articleMapper.selectArticle(id);
	}

	//조회수 증가
	public void upHitcount(int id) {
		articleMapper.upHitcount(id);
		
	}
	
	//게시글 수정
	public void modifyArticle(ArticleVO article) {
		articleMapper.updateArticle(article);
				//게시글 번호를 구한다.
				int articleId = article.getId();
				List<ArticleFileVO> articleFiles = article.getFiles();
				if(articleFiles.size() != 0) {
					for (ArticleFileVO articleFile : articleFiles) {
						articleFile.setArticleId(articleId);
					}
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("articleFiles", articleFiles);
					articleFileMapper.insertArticleFile(map);
					
				}
				
				//파일 번호를 구한다
				String fileNo = article.getFileNo();
				String[] temp = fileNo.split(",");
				
					
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("fileNoList",temp);
					
				articleFileMapper.deleteFile(map);

				
	}
	
	//게시글 삭제
	public void removeArticle(int id) {
		articleFileMapper.deleteArticleFile(id);
		articleReplyMapper.deleteArticleReply(id);
		articleMapper.deleteArticle(id);
	}

	/*//내글을 조회하다
	public List<ArticleVO> myArticle(Map<String, Object> map) {
		return articleMapper.findmyArticle(map);
	}*/
	
	
	//게시글을 삭제하다(여러개)
	public void removeArticles(Map<String, Object> map) {
		articleMapper.deleteArticles(map);
		
		
	}
	
	
	
	
	
	
}
