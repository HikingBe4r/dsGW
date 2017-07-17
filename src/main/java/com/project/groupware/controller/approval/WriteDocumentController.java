package com.project.groupware.controller.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.groupware.domain.DocumentVO;
import com.project.groupware.domain.FormVO;
import com.project.groupware.service.DocumentService;

@Controller
public class WriteDocumentController {

	@Autowired
	private DocumentService documentService;
	
	
	
	@RequestMapping(value="/writeDocument.do", method=RequestMethod.GET)
	public String form() {
		return "approvalNav/document/writeDocument"; 	//양식 목록으로 가게????	
	}
	
	
	@RequestMapping(value="/writeDocument.do", method=RequestMethod.POST)
	public String submit(@RequestParam(value="formId", required=true) String formId,
						@ModelAttribute(value="document") DocumentVO document) {
		
		if(document.getContent() == null) {
		System.out.println("content: "+document.getContent());
		}
		
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
