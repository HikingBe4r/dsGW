package com.project.groupware.domain;

public class ArticleFileVO {
	
	private int id; // 파일 번호
	private int articleId; // 게시글 번호 
	private String originalFileName;
	private String systemFileName;
	private long fileSize; // 파일크기
	
	public ArticleFileVO() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getArticleId() {
		return articleId;
	}

	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getSystemFileName() {
		return systemFileName;
	}

	public void setSystemFileName(String systemFileName) {
		this.systemFileName = systemFileName;
	}

	
	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	@Override
	public String toString() {
		return "ArticleFileVO [id=" + id + ", articleId=" + articleId + ", originalFileName=" + originalFileName
				+ ", systemFileName=" + systemFileName + ", fileSize=" + fileSize + "]";
	}

	
}
