package com.project.groupware.domain;

import java.util.List;

public class DepartmentVO {
	private String id;				//고유 아이디
	private String formId;			//양식 번호
	private String subject;			//문서 제목
	private String content;			//문서 양식
	private String writeday;		//문서 작성일			
	private String endDate;			//시행일
	private String approvalLindId;	//결재선 고유 아이디
	private List<DocumentFileVO> DocumentFileList;	//첨부 파일 목록
	
	public DepartmentVO() {

	}

	public DepartmentVO(String id, String formId, String subject, String content, String writeday, String endDate,
			String approvalLindId, List<DocumentFileVO> documentFileList) {
		this.id = id;
		this.formId = formId;
		this.subject = subject;
		this.content = content;
		this.writeday = writeday;
		this.endDate = endDate;
		this.approvalLindId = approvalLindId;
		DocumentFileList = documentFileList;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFormId() {
		return formId;
	}

	public void setFormId(String formId) {
		this.formId = formId;
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

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getApprovalLindId() {
		return approvalLindId;
	}

	public void setApprovalLindId(String approvalLindId) {
		this.approvalLindId = approvalLindId;
	}

	public List<DocumentFileVO> getDocumentFileList() {
		return DocumentFileList;
	}

	public void setDocumentFileList(List<DocumentFileVO> documentFileList) {
		DocumentFileList = documentFileList;
	}

	@Override
	public String toString() {
		return "DepartmentVO [id=" + id + ", formId=" + formId + ", subject=" + subject + ", content=" + content
				+ ", writeday=" + writeday + ", endDate=" + endDate + ", approvalLindId=" + approvalLindId
				+ ", DocumentFileList=" + DocumentFileList + "]";
	}
	
	
	
}
