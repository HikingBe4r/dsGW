package com.project.groupware.persistent.mapper;

import java.util.List;
import java.util.Map;

import com.project.groupware.domain.EmployeeVO;

public interface EmployeeMapper {

	public void insertEmployee(EmployeeVO employee);
	
	public void updateEmployee(EmployeeVO employee);
	
	public List<EmployeeVO> selectEmployeeList(Map<String, Object> map);
	
	public EmployeeVO selectEmployee(String id);
	
	public String selectAdmin(String id);

}
