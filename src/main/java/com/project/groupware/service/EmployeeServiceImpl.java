package com.project.groupware.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.groupware.domain.EmployeeHistoryVO;
import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.domain.NoticeVO;
import com.project.groupware.persistent.mapper.EmployeeHistoryMapper;
import com.project.groupware.persistent.mapper.EmployeeMapper;
import com.project.groupware.persistent.mapper.NoticeMapper;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private EmployeeMapper empMapper;
	
	@Autowired
	private EmployeeHistoryMapper historyMapper;
	
	@Autowired
	private NoticeMapper noticeMapper;

	public void registerEmployee(EmployeeVO emp) {
		empMapper.insertEmployee(emp);
	}

	public EmployeeVO loginEmployee(EmployeeVO emp) {
		EmployeeVO login = empMapper.selectEmployee(emp.getId());//아이디에 해당하는 사원이 있는가 조회
		if(login != null){//해당하는 사원이 존재하는 경우
			if(login.getPassword().equals(emp.getPassword())){//해당하는 사원의 비밀번호와 입력받은 비밀번호가 같은가 확인
				return login;// 같은 경우 사원정보를 반환
			}
		}
		return null;//정보가 없는 경우 null 반환
	}
	

	public String loginAdmin(String id) {
		return null;
	}

	public void modifyPassword(EmployeeVO emp) {
		empMapper.updateEmployee(emp);
	}

	public void modifyEmployee(EmployeeVO emp) {
		empMapper.updateEmployee(emp);
	}

	public List<EmployeeVO> retrieveEmployeeList(Map<String, Object> map) {
		return empMapper.selectEmployeeList(map);
	}

	public EmployeeVO retrieveEmployee(String id) {
		return empMapper.selectEmployee(id);
	}

	public List<EmployeeHistoryVO> retrieveMemeberHistory(Map<String, Object> map) {
		return historyMapper.selectEmployeeHistory(map);
	}

	public void isreadNotice(NoticeVO notice) {
		noticeMapper.updateNotice(notice);
	}
	
	public void removeNotice(NoticeVO notice) {
		noticeMapper.deleteNotice(notice);
	}
}
