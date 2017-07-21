package com.project.groupware.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.groupware.domain.TempDocumentVO;
import com.project.groupware.persistent.mapper.TempDocumentMapper;

@Service
public class TempDocumentServiceImpl implements TempDocumentService{
	
	@Autowired
	private TempDocumentMapper tempDocumentMapper;

	public List<TempDocumentVO> retrieveTempDocumentList(Map<String, Object> map) {
		return tempDocumentMapper.selectTempDocumentList(map);
	}

	public void modifyTempDocument(TempDocumentVO tempDocumentVO) {
		tempDocumentMapper.updateTempDocument(tempDocumentVO);
	}

	public void removeTempDocument(String tempDocumentId) {
		// TODO Auto-generated method stub
		
	}

	public TempDocumentVO retrieveTempDocument(int tempDocumentId) {
		return tempDocumentMapper.selectTempDocument(tempDocumentId);
	}

	public void registerTempDocument(TempDocumentVO tempDocumentVO) {
		tempDocumentMapper.insertTempDocument(tempDocumentVO);
		
	}	

}