package com.project.groupware.persistent.mapper;

import java.util.List;

import com.project.groupware.domain.NoticeVO;

public interface NoticeMapper {
	
	public void insertNotice(NoticeVO notice);
	
	public void updateNotice(String employeeId);
	
	public void deleteNotice(String employeeId);
	
	public List<NoticeVO> selectNoticeList(String employeeId);
	
	public int countIsRead(String employeeId);
}