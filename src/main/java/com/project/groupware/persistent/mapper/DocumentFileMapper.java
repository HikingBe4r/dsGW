package com.project.groupware.persistent.mapper;

import java.util.Map;

public interface DocumentFileMapper {
	
	void insertDocumentFile(Map<String, Object> map);
	
	void deleteDocumentFile(String documentFileId);
	
}