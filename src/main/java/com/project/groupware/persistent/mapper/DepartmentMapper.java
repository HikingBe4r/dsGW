package com.project.groupware.persistent.mapper;

import java.util.List;
import java.util.Map;

import com.project.groupware.domain.DepartmentVO;

public interface DepartmentMapper {
	
	public void insertDepartment(DepartmentVO dept);
	
	public List<DepartmentVO> selectDepartmentList(Map<String, Object> map);
	
	public DepartmentVO selectDepartment(String id);
	
	public void updateDepartment(Map<String, Object> map);
	
	public void deleteDepartment(DepartmentVO dept);
}
