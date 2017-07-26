package com.project.groupware.persistent.mapper;

import java.util.List;
import java.util.Map;

import com.project.groupware.domain.ApprovalLineVO;
import com.project.groupware.domain.ApproverVO;

public interface ApprovalLineMapper {

	// 결재선 등록
	void insertApprovalLine(ApprovalLineVO approvalLine);
	
	// 결재선 즐겨찾기 등록
	void insertApprovalLineBookmark(ApprovalLineVO approvalLine);

	// 결재자 목록 등록
	void insertApproverList(Map<String, Object> map);

	// 결재선 즐겨찾기 가져오기
	List<ApprovalLineVO> selectApprovalLineList(Map<String, Object> map);

	// 결재선에 등록된 사원들 가져오기
	List<ApproverVO> selectApproverList(String approvalLineId);

	// 결재자 목록 삭제
	void deleteApproverList(String approvalLineId);
	
	// 결재자 목록 조회 : 문서 번호로 찾기
	List<Map<String, Object>> selectApproverMapByDocumentId(String documentId);
	
	// 결재자 목록 조회2 : 문서번호.(승인, 반려할때 씀)
	List<ApproverVO> selectApproverListByDocumentId(String documentId);
	
	// 문서의 현재 결재자 조회
	ApproverVO selectCurrentApprover(String documentId);
	
	// 결재 완료한 결재자 리스트
	List<Map<String, Object>> selectCompleteApproverList(String documentId);
	
	// 결재자 목록 map
	List<Map<String, Object>> selectApproverListDetailDocument(Map<String, Object> map);
	
	// 결재선 삭제
	void deleteApprovalLine(String approvalLineId);
	
	
}
