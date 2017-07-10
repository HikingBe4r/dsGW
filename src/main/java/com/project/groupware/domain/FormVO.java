package com.project.groupware.domain;

public class FormVO {
	
	private String id;			//고유 아이디
	private String subject;		//양식 제목
	private String content;		//양식 내용
	private String writeday;	//등록일
	private int hitcount;		//조회수
	
	
	public FormVO() {
		
	}


	public FormVO(String id, String subject, String content, String writeday, int hitcount) {
		this.id = id;
		this.subject = subject;
		this.content = content;
		this.writeday = writeday;
		this.hitcount = hitcount;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getSubject() {
		return subject;
	}


	public void setSubject(String subject) {
		this.subject = subject;
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


	public int getHitcount() {
		return hitcount;
	}


	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}


	@Override
	public String toString() {
		return "FormVO [id=" + id + ", subject=" + subject + ", content=" + content + ", writeday=" + writeday
				+ ", hitcount=" + hitcount + "]";
	}
	
	
	
	

}
