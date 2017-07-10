package com.project.groupware.domain;

public class DocumentFileVO {
	private String id;					//고유 아이디
	private String originalFileName;	//파일 원본명
	private String systemFileName;		//시스템 파일명
	private int fileSize;				//파일 크기
	private String documentId;			//문서 아이디
	
	public DocumentFileVO() {

	}

	public DocumentFileVO(String id, String originalFileName, String systemFileName, int fileSize, String documentId) {
		this.id = id;
		this.originalFileName = originalFileName;
		this.systemFileName = systemFileName;
		this.fileSize = fileSize;
		this.documentId = documentId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

	public String getDocumentId() {
		return documentId;
	}

	public void setDocumentId(String documentId) {
		this.documentId = documentId;
	}

	@Override
	public String toString() {
		return "DocumentFileVO [id=" + id + ", originalFileName=" + originalFileName + ", systemFileName="
				+ systemFileName + ", fileSize=" + fileSize + ", documentId=" + documentId + "]";
	}
	
	
	
	
}
