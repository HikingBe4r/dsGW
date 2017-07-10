package com.project.groupware.persistent.mapper;

import java.util.List;
import java.util.Map;

import com.project.groupware.domain.ApprovalHistoryVO;
import com.project.groupware.domain.ApprovalLineVO;
import com.project.groupware.domain.ApproverVO;

public interface ApprovalLineMapper {

	void insertApprovalLine(ApprovalLineVO approveLine);

	void insertApproverList(Map<String, Object> map);

	List<ApprovalLineVO> selectApprovalLineList(String employeeId);

	List<ApproverVO> selectApproverList(String approvalLineId);

	void deleteApproverList(String approvalLineId);

}
