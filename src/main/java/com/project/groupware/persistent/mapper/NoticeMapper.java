package com.project.groupware.persistent.mapper;

import java.util.List;

import com.project.groupware.domain.NoticeVO;

public interface NoticeMapper {
	
	void insertNotice(NoticeVO notice);
	
	List<NoticeVO> selectNoticeList(String employeeId);
}
