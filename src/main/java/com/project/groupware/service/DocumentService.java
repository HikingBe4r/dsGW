package com.project.groupware.service;

import java.util.List;
import java.util.Map;

import com.project.groupware.domain.ApprovalLineVO;
import com.project.groupware.domain.ApproverVO;
import com.project.groupware.domain.BookMarkDocumentVO;
import com.project.groupware.domain.DocumentVO;

public interface DocumentService {
	
	
	void registerDocument(DocumentVO document);
	
	void registerApprovalLine(ApprovalLineVO approveLine);
	
	List<ApprovalLineVO> retrieveApprovalLineList(String employeeId);
	
	List<ApproverVO> retrieveApproverList(String approvalLineId);
	
	void modifyApproverList(String approvalLineId, List<ApproverVO> approverList);
	
	List<DocumentVO> retrieveDocumentList(Map<String, Object> map);
	
	void modifyDocument(DocumentVO documentVO);
	
	DocumentVO retrieveDocument(String documentId);
	
	void registerBookMarkDocument(BookMarkDocumentVO bookMarkDocumentVO);
	
	void removeBookMarkDocument(String myDocsId);
	
}