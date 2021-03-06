package com.project.groupware.domain;

import org.springframework.web.multipart.MultipartFile;

public class FormVO {
	// 프로퍼티 안올림.
	
	private String id;			//고유 아이디
	private String subject;		//양식 제목
	private String content;		//양식 내용
	private String writeday;	//등록일
	private int hitcount;		//조회수
	private String formContent;
	private FormFileVO formFile;
	private MultipartFile upload;
	
	private int isBookmark = 0;	// 북마크 테스트
	
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

	public String getFormContent() {
		return formContent;
	}

	public void setFormContent(String formContent) {
		this.formContent = formContent;
	}

	public FormFileVO getFormFile() {
		return formFile;
	}

	public void setFormFile(FormFileVO formFile) {
		this.formFile = formFile;
	}

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}

	@Override
	public String toString() {
		return "FormVO [id=" + id + ", subject=" + subject + ", content=" + content + ", writeday=" + writeday
				+ ", hitcount=" + hitcount + ", formContent=" + formContent + ", formFile=" + formFile + ", upload="
				+ upload + ", isBookmark=" + isBookmark + "]";
	}


	public int getIsBookmark() {
		return isBookmark;
	}


	public void setIsBookmark(int isBookmark) {
		this.isBookmark = isBookmark;
	}
	
	

	

}
