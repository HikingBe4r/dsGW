package com.project.groupware.domain;

public class ArticleReplyVO {

	private int id; // 번호
	private int articleId; // 게시글 번호
	private String employeeId; // 사번
	private String content; // 내용
	private String writeday; // 작성일자
	private EmployeeVO employee = new EmployeeVO(); // 이름 가져오기
	
	
	public ArticleReplyVO() {
		super();
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

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriteday() {
		return writeday;
	}

	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}

	public EmployeeVO getEmployee() {
		return employee;
	}

	public void setEmployee(EmployeeVO employee) {
		this.employee = employee;
	}

	@Override
	public String toString() {
		return "ArticleReplyVO [id=" + id + ", articleId=" + articleId + ", employeeId=" + employeeId + ", content="
				+ content + ", writeday=" + writeday + "]";
	}
	
	
	
	
}
