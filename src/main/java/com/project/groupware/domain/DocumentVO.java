package com.project.groupware.domain;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class DocumentVO {

	private String id;
	private String employeeId;
	private String subject;
	private String content;
	private String writer;
	private String writeday;
	private String endDate; // 시행일
	private String status;
	private FormVO formVO;
	private List<ApproverVO> approverList = new ArrayList<ApproverVO>();
	private List<MultipartFile> upload;	//업로드된 파일
	private List<DocumentFileVO> documentFileList = new ArrayList<DocumentFileVO>();

	public DocumentVO() {

	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public FormVO getFormVO() {
		return formVO;
	}

	public void setFormVO(FormVO formVO) {
		this.formVO = formVO;
	}

	public List<ApproverVO> getApproverList() {
		return approverList;
	}

	public void setApproverList(List<ApproverVO> approverList) {
		this.approverList = approverList;
	}

	public List<MultipartFile> getUpload() {
		return upload;
	}

	public void setUpload(List<MultipartFile> upload) {
		this.upload = upload;
	}

	public List<DocumentFileVO> getDocumentFileList() {
		return documentFileList;
	}

	public void setDocumentFileList(List<DocumentFileVO> documentFileList) {
		this.documentFileList = documentFileList;
	}
	
	public void addDocumentFile(DocumentFileVO documentFile) {
		this.documentFileList.add(documentFile);
	}
	
	public void addApprover(ApproverVO approver) {
		this.approverList.add(approver);
	}

	@Override
	public String toString() {
		return "DocumentVO [id=" + id + ", employeeId=" + employeeId + ", subject=" + subject + ", content=" + content
				+ ", writer=" + writer + ", writeday=" + writeday + ", endDate=" + endDate + ", status=" + status
				+ ", formVO=" + formVO + ", approverList=" + approverList + ", upload=" + upload + ", documentFileList="
				+ documentFileList + "]";
	}	

}