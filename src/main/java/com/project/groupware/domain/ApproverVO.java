package com.project.groupware.domain;

public class ApproverVO {
	private String id;				//고유 아이디
	private int step;				//결재 순서
	private String approvalAuth;	//결재 권한
	private String approvalLineId;	//결재선 아이디
	
	
	public ApproverVO() {
	
	}


	public ApproverVO(String id, int step, String approvalAuth, String approvalLineId) {
		this.id = id;
		this.step = step;
		this.approvalAuth = approvalAuth;
		this.approvalLineId = approvalLineId;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public int getStep() {
		return step;
	}


	public void setStep(int step) {
		this.step = step;
	}


	public String getApprovalAuth() {
		return approvalAuth;
	}


	public void setApprovalAuth(String approvalAuth) {
		this.approvalAuth = approvalAuth;
	}


	public String getApprovalLineId() {
		return approvalLineId;
	}


	public void setApprovalLineId(String approvalLineId) {
		this.approvalLineId = approvalLineId;
	}


	@Override
	public String toString() {
		return "ApproverVO [id=" + id + ", step=" + step + ", approvalAuth=" + approvalAuth + ", approvalLineId="
				+ approvalLineId + "]";
	}
	
	
	
	
}
