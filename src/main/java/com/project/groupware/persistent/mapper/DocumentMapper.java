package com.project.groupware.persistent.mapper;

import java.util.List;
import java.util.Map;

import com.project.groupware.domain.BookMarkDocumentVO;
import com.project.groupware.domain.DocumentVO;

public interface DocumentMapper {
	
	void insertDocument(DocumentVO Document);
	
	List<DocumentVO> selectDocumentList(Map<String, Object> map);
	
	void updateDocument(DocumentVO documentVO);
	
	DocumentVO selectDocument(String documentId);
	
	void insertBookMarkDocument(BookMarkDocumentVO bookMarkDocumentVO);
	
	void deleteBookMarkDocument(BookMarkDocumentVO bookMarkDocumentVO);
	
	void updateDocumentStatus(DocumentVO documentVO);
	
	// 결재 문서 조회 - 성현
	List<Map<String, Object>> selectApprovalDocumentList(Map<String, Object> keyword);
	DocumentVO selectApprovalDocument(String documentId);

	// 해당 양식 사용하는 문서 갯수 조회
	int selectDocumentListByFormId(String formId);
}