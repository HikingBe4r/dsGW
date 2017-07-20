package com.project.groupware.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.project.groupware.domain.ApprovalLineVO;
import com.project.groupware.domain.ApproverVO;
import com.project.groupware.domain.BookMarkDocumentVO;
import com.project.groupware.domain.DocumentVO;

public interface DocumentService {

	void registerDocument(DocumentVO document);

	void registerApprovalLine(ApprovalLineVO approveLine);
	
	void registerApprovalLineBookmark(ApprovalLineVO approveLine);

	List<ApprovalLineVO> retrieveApprovalLineList(String employeeId);

	List<ApproverVO> retrieveApproverList(String approvalLineId);

	void modifyApproverList(String approvalLineId, List<ApproverVO> approverList);

	List<DocumentVO> retrieveDocumentList(Map<String, Object> map);

	void modifyDocument(DocumentVO documentVO);

	DocumentVO retrieveDocument(String documentId);

	void registerBookMarkDocument(BookMarkDocumentVO bookMarkDocumentVO);

	void removeBookMarkDocument(String bookMarkDocumentId);

	// 결재 관련
	Boolean approveDocument(Map<String, Object> map);

	Boolean rejectDocument(Map<String, Object> map);

	// 결재문서리스트 조회
	List<Map<String, Object>> retrieveApprovalDocumentList(Map<String, Object> keyword);

	Map<String, Object> retrieveApprovalDocument(String documentId);

	List<Map<String, Object>> retrieveApproverMapByDocumentId(String documentId);
	
	// 결재자 리스트 조회
	List<Map<String, Object>> retrieveApproverListDetailDocument(Map<String, Object> map);

}