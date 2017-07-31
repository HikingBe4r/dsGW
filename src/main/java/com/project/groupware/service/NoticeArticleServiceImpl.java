package com.project.groupware.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.groupware.domain.ArticleFileVO;
import com.project.groupware.domain.ArticleImageVO;
import com.project.groupware.domain.ArticleVO;
import com.project.groupware.persistent.mapper.NoticeArticleFileMapper;
import com.project.groupware.persistent.mapper.NoticeArticleImageMapper;
import com.project.groupware.persistent.mapper.NoticeArticleMapper;

@Service
public class NoticeArticleServiceImpl implements NoticeArticleService {
	@Autowired
	private NoticeArticleMapper noticeArticleMapper;
	@Autowired
	private NoticeArticleFileMapper noticeArticleFileMapper;
	@Autowired
	private NoticeArticleImageMapper noticeArticleImageMapper;

	// 게시글 등록
	public void registerNoticeArticle(ArticleVO article) {
		noticeArticleMapper.insertNoticeArticle(article);
		// 게시글 번호를 구한다.
		int articleId = article.getId();
		List<ArticleFileVO> articleFiles = article.getFiles();
		List<ArticleImageVO> articleImages = article.getImage();
		if (articleFiles.size() != 0) {
			for (ArticleFileVO articleFile : articleFiles) {
				articleFile.setArticleId(articleId);
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("articleFiles", articleFiles);
			noticeArticleFileMapper.insertArticleFile(map);
		}

		// 이미지

		if (articleImages.size() != 0) {
			for (ArticleImageVO articleImage : articleImages) {
				articleImage.setArticleId(articleId);
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("articleImages", articleImages);
			noticeArticleImageMapper.insertArticleImage(map);
		}
	}

	// 게시글 목록조회
	public List<ArticleVO> retrieveNoticeArticleList(Map<String, Object> map) {
		return noticeArticleMapper.selectNoticeArticleList(map);
	}

	// 게시글 검색
	public List<ArticleVO> searchNoticeArticleList(Map<String, Object> map) {
		return noticeArticleMapper.findNoticeArticleList(map);
	}

	// 전체 게시글 구하기
	public int retrieveTotalNoticeArticle(int boardId) {
		int count = noticeArticleMapper.TotalPostNotice(boardId);
		return count;
	}

	// 게시글 상세 조회
	public ArticleVO retrieveNoticeArticle(int id) {
		return noticeArticleMapper.selectNoticeArticle(id);
	}

	public void modifyNoticeArticle(ArticleVO article) {

		noticeArticleMapper.updateNoticeArticle(article);

		// 게시글 번호를 구한다.
		int articleId = article.getId();

		// 일반 파일인 경우
		List<ArticleFileVO> articleFiles = article.getFiles();
		if (articleFiles.size() != 0) {
			for (ArticleFileVO articleFile : articleFiles) {
				articleFile.setArticleId(articleId);
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("articleFiles", articleFiles);
			noticeArticleFileMapper.insertArticleFile(map);

		}

		// 이미지 파일인 경우
		List<ArticleImageVO> articleImages = article.getImage();
		System.out.println("이미지 파일들 : " + article.getImage());
		if (articleImages.size() != 0) {
			for (ArticleImageVO articleImage : articleImages) {
				articleImage.setArticleId(articleId);
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("articleImages", articleImages);
			noticeArticleImageMapper.insertArticleImage(map);
		}
	}

	public void removeNoticeArticle(int id) {
		noticeArticleFileMapper.deleteArticleFile(id);
		noticeArticleImageMapper.deleteArticleImage(id);
		noticeArticleMapper.deleteNoticeArticle(id);
	}

	// 게시글 조회수
	public void upHitcountNotice(int id) {
		noticeArticleMapper.upHitcountNotice(id);
	}

	// 이전
	public ArticleVO prevNoticeArticle(Map<String, Object> map) {
		return noticeArticleMapper.prevNoticeArticle(map);
	}

	// 다음
	public ArticleVO nextNoticeArticle(Map<String, Object> map) {
		return noticeArticleMapper.nextNoticeArticle(map);
	}

}
