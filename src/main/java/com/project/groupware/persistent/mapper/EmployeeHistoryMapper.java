package com.project.groupware.persistent.mapper;

import java.util.List;
import java.util.Map;

import com.project.groupware.domain.EmployeeHistoryVO;

public interface EmployeeHistoryMapper {
	
	public void insertMemeberHistory(EmployeeHistoryVO history);
	
	public List<EmployeeHistoryVO> selectEmployeeHistory(Map<String, Object> map);
}
