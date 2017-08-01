package com.project.groupware.domain;

import java.util.ArrayList;
import java.util.List;

public class BoardVO {

	private int id;
	private String name;
	private String note;
	private String secret;
	private String departmentId;
	private List<ArticleVO> article = new ArrayList<ArticleVO>();
	private int articleCount; //게시글 카운트
	
	public BoardVO() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	
	public List<ArticleVO> getArticle() {
		return article;
	}
	public void setArticle(List<ArticleVO> article) {
		this.article = article;
	}
	
	public int getArticleCount() {
		return articleCount;
	}
	public void setArticleCount(int articleCount) {
		this.articleCount = articleCount;
	}
	
	
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
	}
	
	public String getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}
	@Override
	public String toString() {
		return "BoardVO [id=" + id + ", name=" + name + ", note=" + note + ", secret=" + secret + ", article=" + article
				+ ", articleCount=" + articleCount + "]";
	}
	
	
	
	
}
