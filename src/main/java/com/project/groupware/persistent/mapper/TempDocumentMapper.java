package com.project.groupware.persistent.mapper;

import java.util.List;
import java.util.Map;

import com.project.groupware.domain.TempDocumentVO;

public interface TempDocumentMapper {
	
	List<TempDocumentVO> selectTempDocumentList(Map<String, Object> map);
	
	void updateTempDocument(TempDocumentVO tempDocumentVO);
	
	void deleteTempDocument(Map<String, Object> map);
	
	TempDocumentVO selectTempDocument(int tempDocumentId);
	
	void insertTempDocument(TempDocumentVO tempDocumentVO);

}