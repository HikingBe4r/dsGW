package com.project.groupware.persistent.mapper;

import java.util.List;
import java.util.Map;

import com.project.groupware.domain.ApprovalLineVO;
import com.project.groupware.domain.ApproverVO;

public interface ApprovalLineMapper {

	// 결재선 등록
	void insertApprovalLine(ApprovalLineVO approvalLine);

	// 결재자 목록 등록
	void insertApproverList(Map<String, Object> map);

	// 결재선 즐겨찾기 가져오기
	List<ApprovalLineVO> selectApprovalLineList(String employeeId);

	// 결재선에 등록된 사원들 가져오기
	List<ApproverVO> selectApproverList(String approvalLineId);

	// 결재자 목록 삭제
	void deleteApproverList(String approvalLineId);

}
