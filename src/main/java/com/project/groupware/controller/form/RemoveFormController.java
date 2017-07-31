package com.project.groupware.controller.form;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.FormFileVO;
import com.project.groupware.domain.FormVO;
import com.project.groupware.service.FormService;
import com.project.groupware.util.UploadFileUtils;

@Controller
public class RemoveFormController {
	
	@Autowired
	private FormService formService;
	
	@RequestMapping(value="/removeForm.do", method=RequestMethod.GET)
	public ModelAndView removeForm(@RequestParam(value="formId", required=true) String formId,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		FormVO form = formService.retrieveForm(formId);
		
		boolean isSuccess = formService.removeForm(formId);
		
		if(isSuccess) {
			FormFileVO file1 = form.getFormFile();
			if(file1 != null) {
				File file = null;
				file = new File(UploadFileUtils.getUploadPath(request) + File.separator + "form" + File.separator + file1.getSystemFileName());
				System.out.println("UPLOAD_PATH: "+UploadFileUtils.getUploadPath(request));
				System.out.println("removeForm: filePath: " + file.getAbsolutePath());
				if(file.exists()) {
					file.delete();
				}
			}
			// true이면
			mv.setViewName("redirect:/listForm.do?boardId=1");
		} else {
			mv.setViewName("adminNav/form/removeFormFail");
		}		
		
		return mv;
	}
}
