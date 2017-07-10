package com.project.groupware.domain;

public class FormFileVO {
	private String id;
	private String formId;
	private String originalFileName;
	private String systemFileName;
	private double fileSize;
	public FormFileVO() {
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
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getSystemFileName() {
		return systemFileName;
	}
	public void setSystemFileName(String systemFileName) {
		this.systemFileName = systemFileName;
	}
	public double getFileSize() {
		return fileSize;
	}
	public void setFileSize(double fileSize) {
		this.fileSize = fileSize;
	}
	@Override
	public String toString() {
		return "FormFileVO [id=" + id + ", formId=" + formId + ", originalFileName=" + originalFileName
				+ ", systemFileName=" + systemFileName + ", fileSize=" + fileSize + "]";
	}
	
	
}
