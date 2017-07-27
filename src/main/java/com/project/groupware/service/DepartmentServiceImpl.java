package com.project.groupware.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.groupware.domain.DepartmentVO;
import com.project.groupware.persistent.mapper.DepartmentMapper;

@Service
public class DepartmentServiceImpl implements DepartmentService {

	@Autowired
	private DepartmentMapper deptMapper;

	public void registerDepartment(DepartmentVO dept) {
		deptMapper.insertDepartment(dept);
	}

	public void modifyDepartment(Map<String, Object> keyword) {
		deptMapper.updateDepartment(keyword);
	}

	public void removeDepartment(DepartmentVO dept) {
		deptMapper.deleteDepartment(dept);
	}

	public DepartmentVO retrieveDepartment(String id) {
		return deptMapper.selectDepartment(id);
	}

	public List<DepartmentVO> retrieveDepartmentList(Map<String, Object> keyword) {
		return deptMapper.selectDepartmentList(keyword);
	}

	public List<DepartmentVO> retrieveDepartmentListWithCount() {
		return deptMapper.selectDepartmentListWithCount();
	}
	
	

}
