package com.project.groupware.persistent.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.project.groupware.domain.AdminVO;
import com.project.groupware.domain.EmployeeVO;

public interface EmployeeMapper {

	public void insertEmployee(EmployeeVO employee);
	
	public void updateEmployee(EmployeeVO employee);
	
	public List<EmployeeVO> selectEmployeeList(Map<String, Object> map);
	
	public EmployeeVO selectEmployee(String id);
	
	public AdminVO selectAdmin(String id);
	
	public List<HashMap<String, Object>> selectGrade();
	
	public List<HashMap<String, Object>> selectStatus();
	
	public EmployeeVO selectEmployeeDetail(String id);

	public List<EmployeeVO> selectEmployeeDetailList(Map<String, Object> map);
	
	public EmployeeVO selectEmployeeFind(EmployeeVO emp);
	
	public List<EmployeeVO> selectEmployeeByDepartment(String departmentId);
}
