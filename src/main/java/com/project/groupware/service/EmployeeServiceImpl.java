package com.project.groupware.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.groupware.domain.AdminVO;
import com.project.groupware.domain.EmployeeHistoryVO;
import com.project.groupware.domain.EmployeeImageVO;
import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.domain.NoticeVO;
import com.project.groupware.persistent.mapper.EmployeeHistoryMapper;
import com.project.groupware.persistent.mapper.EmployeeImageMapper;
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

	@Autowired
	private EmployeeImageMapper imageMapper;

	public void registerEmployee(EmployeeVO emp) {
		empMapper.insertEmployee(emp);
		String empId = emp.getId();
		List<EmployeeImageVO> empImageList = emp.getImageList();
		if (empImageList.size() != 0) {
			empImageList.get(0).setEmployeeId(empId);
			empImageList.get(0).setKind("1");
			empImageList.get(1).setEmployeeId(empId);
			empImageList.get(1).setKind("2");

			imageMapper.insertImage(empImageList.get(0));
			imageMapper.insertImage(empImageList.get(1));
		}
	}

	public EmployeeVO loginEmployee(EmployeeVO emp) {
		EmployeeVO login = empMapper.selectEmployee(emp.getId());// 아이디에 해당하는
																	// 사원이 있는가
																	// 조회
		if (login != null) {// 해당하는 사원이 존재하는 경우
			if (login.getPassword().equals(emp.getPassword())) {// 해당하는 사원의
																// 비밀번호와 입력받은
																// 비밀번호가 같은가 확인
				return login;// 같은 경우 사원정보를 반환
			}
		}
		return null;// 정보가 없는 경우 null 반환
	}

	public AdminVO loginAdmin(AdminVO admin) {
		AdminVO login = empMapper.selectAdmin(admin.getId());
		if (login != null) {
			if (login.getPassword().equals(admin.getPassword())) {
				return login;
			}
		}
		return null;
	}

	public void modifyPassword(EmployeeVO emp) {
		empMapper.updateEmployee(emp);
	}

	public void modifyEmployee(EmployeeVO emp) {
		empMapper.updateEmployee(emp);
		String empId = emp.getId();
		List<EmployeeImageVO> empImageList = emp.getImageList();
		if (empImageList.size() != 0) {

			imageMapper.deleteImage(empId);
			empImageList.get(0).setEmployeeId(empId);
			empImageList.get(0).setKind("1");
			empImageList.get(1).setEmployeeId(empId);
			empImageList.get(1).setKind("2");

			imageMapper.insertImage(empImageList.get(0));
			imageMapper.insertImage(empImageList.get(1));
		}
	}

	public List<EmployeeVO> retrieveEmployeeList(Map<String, Object> map) {
		return empMapper.selectEmployeeList(map);
	}

	public EmployeeVO retrieveEmployee(String id) {
		return empMapper.selectEmployee(id);
	}

	public List<EmployeeHistoryVO> retrieveEmployeeHistory(Map<String, Object> map) {
		return historyMapper.selectEmployeeHistory(map);
	}

	public List<NoticeVO> retrieveNoticeList(String empId) {
		return noticeMapper.selectNoticeList(empId);
	}

	public int checkIsRead(String empId) {
		return noticeMapper.countIsRead(empId);
	}

	public void isReadNotice(String empId) {
		noticeMapper.updateNotice(empId);
	}

	public void removeNotice(String empId) {
		noticeMapper.deleteNotice(empId);
	}

	public EmployeeVO retrieveEmployeeDetail(String id) {
		return empMapper.selectEmployeeDetail(id);
	}

	public List<HashMap<String, Object>> retrieveGradeList() {
		return empMapper.selectGrade();
	}

	public List<HashMap<String, Object>> retrieveStatusList() {
		return empMapper.selectStatus();
	}

	public List<EmployeeVO> retrieveEmployeeDetailList(Map<String, Object> map) {
		return empMapper.selectEmployeeDetailList(map);
	}

	public EmployeeVO findEmployeeId(EmployeeVO emp) {
		return empMapper.selectEmployeeFind(emp);
	}

	public List<EmployeeVO> retrieveEmployeeByDepartment(String departmentId) {
		return empMapper.selectEmployeeByDepartment(departmentId);
	}

	public EmployeeImageVO retrieveEmployeeImage(Map<String, Object> keyword) {
		return imageMapper.selectImage(keyword);
	}

	public String checkEmail(String email) {
		return empMapper.selectEmail(email);
	}

}
