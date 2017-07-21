package com.project.groupware.controller.form;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.BookmarkFormVO;
import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.service.FormService;

@Controller
public class RegisterBookmarkFormController {
	
	@Autowired
	private FormService formService;
	
	@RequestMapping(value="registerBookmarkForm.do", method=RequestMethod.POST)
	public ModelAndView registerBookmarkFormController(
			@SessionAttribute(value="employee") EmployeeVO employee,
			@RequestParam(value="formId", required=true) String formId) {
		
		ModelAndView mv = new ModelAndView();
		
		String employeeId = employee.getId();
		
		BookmarkFormVO bookmark = new BookmarkFormVO();
		bookmark.setEmployeeId(employeeId);
		bookmark.setFormId(formId);
		
		formService.registerBookmarkForm(bookmark);
		
		mv.setViewName("jsonView");
		
		return mv;
	}
}
