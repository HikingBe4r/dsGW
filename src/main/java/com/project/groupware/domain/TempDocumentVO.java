package com.project.groupware.domain;

public class TempDocumentVO {

	private String id;
	private String employeeId;
	private String subject;
	private String content;
	private String writer;
	private String departmentName;
	private String writeday; // 작성일(임시 저장한 날짜)
	private String endDate;
	private FormVO formVO;

	public TempDocumentVO() {

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

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
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

	public FormVO getFormVO() {
		return formVO;
	}

	public void setFormVO(FormVO formVO) {
		this.formVO = formVO;
	}

	@Override
	public String toString() {
		return "TempDocumentVO [id=" + id + ", employeeId=" + employeeId + ", subject=" + subject + ", content="
				+ content + ", writer=" + writer + ", departmentName=" + departmentName + ", writeday=" + writeday
				+ ", endDate=" + endDate + ", formVO=" + formVO + "]";
	}

}