package com.project.groupware.domain;

public class BookmarkFormVO {
	private String id;
	private String formId;
	private String employeeId;
	public BookmarkFormVO() {
		super();
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
	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	@Override
	public String toString() {
		return "BookmarkFormVO [id=" + id + ", formId=" + formId + ", employeeId=" + employeeId + "]";
	}
	
	
}
