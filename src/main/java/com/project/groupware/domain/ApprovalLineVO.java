package com.project.groupware.domain;

import java.util.List;

public class ApprovalLineVO {
	private String id;						//고유 아이디
	private String employeeId;				//사번
	private String subject;					//즐겨찾기 이름(null일 경우, 일반결재선)
	private List<ApproverVO> approverList;	//결재자 목록
	
	public ApprovalLineVO() {

	}

	public ApprovalLineVO(String id, String employeeId, String subject, List<ApproverVO> approverList) {
		this.id = id;
		this.employeeId = employeeId;
		this.subject = subject;
		this.approverList = approverList;
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

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public List<ApproverVO> getApproverList() {
		return approverList;
	}

	public void setApproverList(List<ApproverVO> approverList) {
		this.approverList = approverList;
	}

	@Override
	public String toString() {
		return "ApprovalLineVO [id=" + id + ", employeeId=" + employeeId + ", subject=" + subject + ", approverList="
				+ approverList + "]";
	}
	
	
	
	
	
}
