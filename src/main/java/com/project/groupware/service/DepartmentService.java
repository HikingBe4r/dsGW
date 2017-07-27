package com.project.groupware.service;

import java.util.List;
import java.util.Map;

import com.project.groupware.domain.DepartmentVO;

public interface DepartmentService {
	
	public void registerDepartment(DepartmentVO dept);
	
	public void modifyDepartment(Map<String, Object> keyword);
	
	public void removeDepartment(DepartmentVO dept);
	
	public DepartmentVO retrieveDepartment(String id);
	
	public List<DepartmentVO> retrieveDepartmentList(Map<String, Object> keyword);
	
	public List<DepartmentVO> retrieveDepartmentListWithCount();
}
