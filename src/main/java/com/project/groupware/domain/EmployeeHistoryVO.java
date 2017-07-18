package com.project.groupware.domain;

public class EmployeeHistoryVO {
	private String id;
	private EmployeeVO employee = new EmployeeVO();
	private String startDate;
	private String endDate;
	private String kind;
	private String oldContent;
	private String newContent;

	public EmployeeHistoryVO() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public EmployeeVO getEmployee() {
		return employee;
	}

	public void setEmployee(EmployeeVO employee) {
		this.employee = employee;
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

	public String getOldContent() {
		return oldContent;
	}

	public void setOldContent(String oldContent) {
		this.oldContent = oldContent;
	}

	public String getNewContent() {
		return newContent;
	}

	public void setNewContent(String newContent) {
		this.newContent = newContent;
	}

	@Override
	public String toString() {
		return "EmployeeHistoryVO [id=" + id + ", employee=" + employee + ", startDate=" + startDate + ", endDate="
				+ endDate + ", kind=" + kind + ", oldContent=" + oldContent + ", newContent=" + newContent + "]";
	}

}
