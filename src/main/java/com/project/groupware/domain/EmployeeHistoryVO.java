package com.project.groupware.domain;

public class EmployeeHistoryVO {
	private String id;
	private String employeeId;
	private String startDate;
	private String endDate;
	private String kind;
	private String content;
	

	public EmployeeHistoryVO() {
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

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "EmployeeHistoryVO [id=" + id + ", employeeId=" + employeeId + ", startDate=" + startDate + ", endDate="
				+ endDate + ", kind=" + kind + ", content=" + content + "]";
	}

}
