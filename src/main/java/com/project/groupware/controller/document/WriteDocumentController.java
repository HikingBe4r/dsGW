package com.project.groupware.controller.document;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.DocumentVO;
import com.project.groupware.domain.FormVO;
import com.project.groupware.service.DocumentService;
import com.project.groupware.service.FormService;

@Controller
public class WriteDocumentController {

	@Autowired
	private DocumentService documentService;
	@Autowired
	private FormService formService;
	
	
	@RequestMapping(value="/writeDocument.do", method=RequestMethod.GET)
	public ModelAndView form(@RequestParam(value="id", required=true) String formId) {
		
		ModelAndView mv = new ModelAndView();				
		mv.addObject("form", formService.retrieveForm(formId));
		mv.setViewName("approvalNav/document/writeDocument");
		
		return mv;		
	}
	
	
	@RequestMapping(value="/writeDocument.do", method=RequestMethod.POST)
	public String submit(@RequestParam(value="formId", required=true) String formId,
						@ModelAttribute(value="document") DocumentVO document) {
		
		
		FormVO form = new FormVO();
		form.setId(formId);
		document.setFormVO(form);
		
		document.setStatus("1");
		
		/* 파일 업로드
		List<MultipartFile> fileList = document.getUpload();
		for(MultipartFile file : fileList) {
			if(!file.isEmpty()) {
				//DocumentFileVO documentFile = UploadFileUtils.uploadFile(file);
				//document.addDocumentFile(documentFile);
			}
		}*/
		
		documentService.registerDocument(document);	
		return "approvalNav/document/writeSuccess"; 		
	}
	
}
