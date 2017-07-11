package com.project.groupware.service;

import java.util.List;
import java.util.Map;

import com.project.groupware.domain.BookmarkFormVO;
import com.project.groupware.domain.FormVO;

public interface FormService {
	
	// 양식
	List<FormVO> retrieveFormList(String keyword);
	FormVO retrieveForm(String id);
	void registerForm(FormVO formVO);
	void removeForm(String id);
	void modifyForm(FormVO formVO);

	// 양식 즐겨찾기
	List<BookmarkFormVO> retrieveBookmarkFormList(String keyword);
	void registerBookmarkForm(BookmarkFormVO bookmarkFormVO);
	void removeBookmarkForm(String id);
}
