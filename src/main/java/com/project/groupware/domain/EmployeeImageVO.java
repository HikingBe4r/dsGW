package com.project.groupware.domain;

public class EmployeeImageVO {
	private String id;
	private String employeeId;
	private String originalFileName;
	private String systemFileName;
	private String fileSize;
	private String kind;
	
	public EmployeeImageVO(){
		super();
	}
	
	public EmployeeImageVO(String id, String employeeId, String originalFileName, String systemFileName,
			String fileSize, String kind) {
		super();
		this.id = id;
		this.employeeId = employeeId;
		this.originalFileName = originalFileName;
		this.systemFileName = systemFileName;
		this.fileSize = fileSize;
		this.kind = kind;
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
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}

	@Override
	public String toString() {
		return "EmployeeImageVO [id=" + id + ", employeeId=" + employeeId + ", originalFileName=" + originalFileName
				+ ", systemFileName=" + systemFileName + ", fileSize=" + fileSize + ", kind=" + kind + "]";
	}
	
	
	
}
