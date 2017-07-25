package com.project.groupware.persistent.mapper;

import java.util.Map;

import com.project.groupware.domain.EmployeeImageVO;

public interface EmployeeImageMapper {
	
	public void insertImage(EmployeeImageVO image);
	
	public EmployeeImageVO selectImage(Map<String, Object>map);
	
	public void deleteImage(String id);
}
