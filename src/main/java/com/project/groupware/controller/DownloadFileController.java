package com.project.groupware.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DownloadFileController {
	
	@RequestMapping(value="downloadFile.do")
	public ModelAndView downloadFile(
			@RequestParam(value="originalFileName", required=true) String originalFileName,
			@RequestParam(value="systemFileName", required=true) String systemFileName,
			@RequestParam(value="kind", required=true) String kind	// form, document, article등
			) {
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("originalFileName", originalFileName);
		mv.addObject("systemFileName", systemFileName);
		mv.addObject("kind", kind);
		mv.setViewName("download");
		return mv;
		
	}
}
