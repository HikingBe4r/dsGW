package com.project.groupware.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.project.groupware.domain.AdminVO;
import com.project.groupware.domain.EmployeeHistoryVO;
import com.project.groupware.domain.EmployeeImageVO;
import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.domain.NoticeVO;

public interface EmployeeService {
	public void registerEmployee(EmployeeVO emp);
	
	public EmployeeVO loginEmployee(EmployeeVO emp);
	
	public AdminVO loginAdmin(AdminVO admin);
	
	public void modifyPassword(EmployeeVO emp);
	
	public void modifyEmployee(EmployeeVO emp);
	
	public List<EmployeeVO> retrieveEmployeeList(Map<String, Object> keyword);
	
	public EmployeeVO retrieveEmployee(String id);
	
	public List<EmployeeHistoryVO> retrieveEmployeeHistory(Map<String, Object> keyword);
	
	public void isreadNotice(NoticeVO notice);
	
	public void removeNotice(NoticeVO notice);
	
	public EmployeeVO retrieveEmployeeDetail(String id);

	public List<HashMap<String, Object>> retrieveGradeList();
	
	public List<HashMap<String, Object>> retrieveStatusList();
	
	public List<EmployeeVO> retrieveEmployeeDetailList(Map<String, Object> keyword);
	
	public EmployeeVO findEmployeeId(EmployeeVO emp);
	
	public List<EmployeeVO> retrieveEmployeeByDepartment(String departmentId);
	
	public EmployeeImageVO retrieveEmployeeImage(Map<String, Object> keyword);

}
