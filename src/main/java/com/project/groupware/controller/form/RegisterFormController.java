package com.project.groupware.controller.form;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.project.groupware.domain.FormFileVO;
import com.project.groupware.domain.FormVO;
import com.project.groupware.service.FormService;
import com.project.groupware.util.UploadFileUtils;

@Controller
public class RegisterFormController {
	
	@Autowired
	private FormService formService;
	
	
	@RequestMapping(value="/registerForm.do", method=RequestMethod.GET)
	public String form() {
		return "approvalNav/form/registerForm";
	}
	
	@RequestMapping(value="/registerForm.do", method=RequestMethod.POST)
	public String submit(
			@ModelAttribute(value="form") FormVO form, 
			HttpServletRequest request) throws Exception {
		
		MultipartFile upload = form.getUpload();
		
		if(!upload.isEmpty()) {
			FormFileVO formFile = UploadFileUtils.uploadFormFile(upload, request);
			form.setFormFile(formFile);
		}
		
		formService.registerForm(form);
		
		return "approvalNav/form/registerFormSuccess";
	}
}
