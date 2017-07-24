package com.project.groupware.service;

import java.util.List;
import java.util.Map;

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

	public List<FormVO> retrieveFormList(Map<String, Object> map) {
		
		return formMapper.selectFormList(map);
	}

	public FormVO retrieveForm(String id) {
		FormVO form = formMapper.selectForm(id);
		formMapper.upHitcount(id);
		return form;
	}

	public void registerForm(FormVO formVO) throws Exception{
		formMapper.insertForm(formVO);
		
		FormFileVO formFile = formVO.getFormFile();
		
		if(formFile != null) {
			
			formFile.setFormId(formVO.getId());
			formFileMapper.insertFormFile(formFile);
		}
		
		
			
	}
	

	public void removeForm(String formId) {		
		formFileMapper.deleteFormFile(formId);
		formMapper.deleteForm(formId);	
	}
	
	public void modifyForm(FormVO formVO) {
		formMapper.updateForm(formVO);
		FormFileVO formFile = formVO.getFormFile();
		
		if(formFile != null) {
			formFileMapper.deleteFormFile(formVO.getId());
			formFile.setFormId(formVO.getId());
			formFileMapper.insertFormFile(formFile);
		}
		
		
	}


	public List<BookmarkFormVO> retrieveBookmarkFormList(String employeeId) {
		return formMapper.selectBookmarkFormList(employeeId);
	}

	public void registerBookmarkForm(BookmarkFormVO bookmarkFormVO) {
		List<BookmarkFormVO> formList = formMapper.selectBookmarkFormList(bookmarkFormVO.getEmployeeId());
		int check = 0;
		for(BookmarkFormVO bookmark : formList) {
			if(bookmark.getFormId().equals(bookmarkFormVO.getFormId())) {
				check++;
			}
		}	
		if(check==0) {
			formMapper.insertBookmarkForm(bookmarkFormVO);
		}
	}

	public void removeBookmarkForm(BookmarkFormVO bookmarkFormVO) {
		formMapper.removeBookmarkForm(bookmarkFormVO);
	}
	
}
