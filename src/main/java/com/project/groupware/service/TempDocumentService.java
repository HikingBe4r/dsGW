package com.project.groupware.service;

import java.util.List;
import java.util.Map;

import com.project.groupware.domain.TempDocumentVO;

public interface TempDocumentService {
	
	List<TempDocumentVO> retrieveTempDocumentList(Map<String, Object> map);
	
	void modifyTempDocument(TempDocumentVO tempDocumentVO);
	
	void removeTempDocument(String tempDocumentId);
	
	TempDocumentVO retrieveTempDocument(int tempDocumentId);
	
	void registerTempDocument(TempDocumentVO tempDocumentVO);
	
}