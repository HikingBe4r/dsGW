package com.project.groupware.persistent.mapper;

import java.util.List;
import java.util.Map;

import com.project.groupware.domain.BookmarkFormVO;
import com.project.groupware.domain.FormVO;

public interface FormMapper {
	// 양식
	List<FormVO> selectFormList(String keyword);
	FormVO selectForm(String id);
	void insertForm(FormVO formVO);
	void deleteForm(String id);
	void updateForm(FormVO formVO);
	void upHitcount(String id);
	
	// 양식 즐겨찾기
	List<BookmarkFormVO> selectBookmarkFormList(String keyword);
	void insertBookmarkForm(BookmarkFormVO bookmarkFormVO);
	void removeBookmarkForm(String id);
}
