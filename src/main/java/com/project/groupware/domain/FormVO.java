package com.project.groupware.domain;

public class FormVO {
	// 프로퍼티 안올림.
	
	private String id;			//고유 아이디
	private String subject;		//양식 제목
	private String content;		//양식 내용
	private String writeday;	//등록일
	private int hitcount;		//조회수
	private FormFileVO formFile;
	
	public FormVO() {
		
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

	public FormFileVO getFormFile() {
		return formFile;
	}

	public void setFormFile(FormFileVO formFile) {
		this.formFile = formFile;
	}

	@Override
	public String toString() {
		return "FormVO [id=" + id + ", subject=" + subject + ", content=" + content + ", writeday=" + writeday
				+ ", hitcount=" + hitcount + ", formFile=" + formFile + "]";
	}
	
	

}
