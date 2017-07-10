package com.project.groupware.domain;

public class ApprovalHistoryVO {
	private String id;			//고유 아이디
	private String documentId;	//문서 아이디
	private String approverId;	//결재자 아이디
	private String date;		//결재 날짜
	private String status;		//결재 상태(기안, 승인, 반려)
	private String comment;		//결재 사유
	
	public ApprovalHistoryVO() {

	}

	public ApprovalHistoryVO(String id, String documentId, String approverId, String date, String status,
			String comment) {
		this.id = id;
		this.documentId = documentId;
		this.approverId = approverId;
		this.date = date;
		this.status = status;
		this.comment = comment;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDocumentId() {
		return documentId;
	}

	public void setDocumentId(String documentId) {
		this.documentId = documentId;
	}

	public String getApproverId() {
		return approverId;
	}

	public void setApproverId(String approverId) {
		this.approverId = approverId;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	@Override
	public String toString() {
		return "ApprovalHistoryVO [id=" + id + ", documentId=" + documentId + ", approverId=" + approverId + ", date="
				+ date + ", status=" + status + ", comment=" + comment + "]";
	}	
	

}
