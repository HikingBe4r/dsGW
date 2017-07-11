package com.project.groupware.persistent.mapper;

import com.project.groupware.domain.ApprovalHistoryVO;

public interface ApprovalHistoryMapper {
	
	//결재이력 등록
	void insertApprovalHistory(ApprovalHistoryVO history);
}
