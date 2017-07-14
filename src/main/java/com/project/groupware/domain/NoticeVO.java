package com.project.groupware.domain;

public class NoticeVO {
	private String id;
	private String employeeId;
	private String content;
	private String writeDay;
	private String isRead;

	public NoticeVO() {
		super();
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriteDay() {
		return writeDay;
	}

	public void setWriteDay(String writeDay) {
		this.writeDay = writeDay;
	}

	public String getIsRead() {
		return isRead;
	}

	public void setIsRead(String isRead) {
		this.isRead = isRead;
	}

	@Override
	public String toString() {
		return "NoticeVO [id=" + id + ", employeeId=" + employeeId + ", content=" + content + ", writeDay=" + writeDay
				+ ", isRead=" + isRead + "]";
	}

}
