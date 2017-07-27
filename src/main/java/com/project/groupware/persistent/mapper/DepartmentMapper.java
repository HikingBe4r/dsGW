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
	
	public List<DepartmentVO> selectDepartmentListWithCount();
	
	/*게시판에서 부서 이름 가져오기*/
	public List<DepartmentVO> selectDepartmentListID();
}
