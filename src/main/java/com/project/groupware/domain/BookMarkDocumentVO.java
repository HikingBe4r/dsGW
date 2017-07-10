package com.project.groupware.domain;

public class BookMarkDocumentVO {
	
	private String id;
	private String employeeId;
	private String documentId;
	
	public BookMarkDocumentVO() {
		
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

	public String getDocumentId() {
		return documentId;
	}

	public void setDocumentId(String documentId) {
		this.documentId = documentId;
	}

	@Override
	public String toString() {
		return "BookMarkDocumentVO [id=" + id + ", employeeId=" + employeeId + ", documentId=" + documentId + "]";
	}	

}