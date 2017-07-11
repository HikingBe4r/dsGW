package com.project.groupware.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.groupware.domain.BookmarkFormVO;
import com.project.groupware.domain.FormFileVO;
import com.project.groupware.domain.FormVO;
import com.project.groupware.persistent.mapper.FormFileMapper;
import com.project.groupware.persistent.mapper.FormMapper;

@Service
public class FormServiceImpl implements FormService{
	@Autowired
	private FormMapper formMapper;
	
	@Autowired
	private FormFileMapper formFileMapper;

	public List<FormVO> retrieveFormList(String keyword) {
		formMapper.selectFormList(keyword);
		return null;
	}

	public FormVO retrieveForm(String id) {
		FormVO form = formMapper.selectForm(id);
		formMapper.upHitcount(id);
		return form;
	}

	public void registerForm(FormVO formVO) {
		formMapper.insertForm(formVO);
		FormFileVO formFile = formVO.getFormFile();
		if(formFile != null) {
			formFile.setFormId(formVO.getId());
		}
		formFileMapper.insertFormFile(formFile);	
	}

	public void removeForm(String id) {		
		formFileMapper.deleteFormFile(id);
		formMapper.deleteForm(id);				
	}
	
	public void modifyForm(FormVO formVO) {
		formMapper.updateForm(formVO);
	}

	public List<BookmarkFormVO> retrieveBookmarkFormList(String keyword) {
		return formMapper.selectBookmarkFormList(keyword);
	}

	public void registerBookmarkForm(BookmarkFormVO bookmarkFormVO) {
		formMapper.insertBookmarkForm(bookmarkFormVO);		
	}

	public void removeBookmarkForm(String id) {
		formMapper.removeBookmarkForm(id);
	}
	
}
