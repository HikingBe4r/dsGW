package com.project.groupware.domain;

public class NoticeVO {
	private String id;			//고유 아이디
	private String employeeId;	//사번
	private String content;		//알림 내용
	private boolean status;		//알림 확인 여부
	
	public NoticeVO() {
	
	}

	public NoticeVO(String id, String employeeId, String content, boolean status) {
		this.id = id;
		this.employeeId = employeeId;
		this.content = content;
		this.status = status;
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

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "NoticeVO [id=" + id + ", employeeId=" + employeeId + ", content=" + content + ", status=" + status
				+ "]";
	}
	
	
	
	

}
