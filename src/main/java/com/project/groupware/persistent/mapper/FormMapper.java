package com.project.groupware.persistent.mapper;

import java.util.List;

import com.project.groupware.domain.FormVO;

public interface FormMapper {
	
	List<FormVO> selectFormList();
	
}
