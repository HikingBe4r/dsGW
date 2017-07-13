package com.project.groupware.persistent.mapper;

import java.util.List;

import com.project.groupware.domain.NoticeVO;

public interface NoticeMapper {
	
	void insertNotice(NoticeVO notice);
	
	public void updateNotice(NoticeVO notice);
	
	public void deleteNotice(NoticeVO notice);
	
	List<NoticeVO> selectNoticeList(String employeeId);
}
