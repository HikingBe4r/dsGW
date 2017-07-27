package com.project.groupware.controller.form;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.FormFileVO;
import com.project.groupware.domain.FormVO;
import com.project.groupware.service.FormService;
import com.project.groupware.util.UploadFileUtils;

@Controller
public class ModifyFormController {
	
	@Autowired
	private FormService formService;
	
	
	@RequestMapping(value="/modifyForm.do", method=RequestMethod.GET)
	public ModelAndView form(
			@RequestParam(value="formId") String formId) {
		ModelAndView mv = new ModelAndView();
		
		FormVO form = formService.retrieveForm(formId);
		form.setFormContent(form.getFormContent().replace("\n", ""));
		form.setFormContent(form.getFormContent().replace("\r", ""));
		mv.addObject("form", form);
		
		mv.setViewName("adminNav/form/modifyForm");
		
		return mv;
	}
	
	@RequestMapping(value="/modifyForm.do", method=RequestMethod.POST)
	public String submit(
			@ModelAttribute(value="formVO") FormVO form,
			HttpServletRequest request) throws Exception{
		
		MultipartFile upload = form.getUpload();
		if(!upload.isEmpty()) {
			FormFileVO formFile = UploadFileUtils.uploadFormFile(upload, request);
			form.setFormFile(formFile);
		}
		
		formService.modifyForm(form);
		
		return "redirect:/listFormForAdmin.do?boardId=1";
	}
}
