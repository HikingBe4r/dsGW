package com.project.groupware.domain;

public class ArticleImageVO {
	private int id;
	private String originalImageName;
	private String systemImageName;
	private long fileSize;
	private int articleId;
	public ArticleImageVO() {
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOriginalImageName() {
		return originalImageName;
	}
	public void setOriginalImageName(String originalImageName) {
		this.originalImageName = originalImageName;
	}
	public String getSystemImageName() {
		return systemImageName;
	}
	public void setSystemImageName(String systemImageName) {
		this.systemImageName = systemImageName;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public int getArticleId() {
		return articleId;
	}
	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}
	@Override
	public String toString() {
		return "ArticleImageVO [id=" + id + ", originalImageName=" + originalImageName + ", systemImageName="
				+ systemImageName + ", fileSize=" + fileSize + ", articleId=" + articleId + "]";
	}


}
