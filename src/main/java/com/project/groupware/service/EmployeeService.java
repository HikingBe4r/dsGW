package com.project.groupware.service;

import java.util.List;
import java.util.Map;

import com.project.groupware.domain.AdminVO;
import com.project.groupware.domain.EmployeeHistoryVO;
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
	
	public List<EmployeeHistoryVO> retrieveMemeberHistory(Map<String, Object> keyword);
	
	public void isreadNotice(NoticeVO notice);
	
	public void removeNotice(NoticeVO notice);
}
