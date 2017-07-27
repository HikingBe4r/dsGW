package com.project.groupware.controller.article;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DownloadArticleFileController {

	/*@RequestMapping(value="/downloadFile.do", method=RequestMethod.GET)
	public ModelAndView downloadFile(
			@RequestParam(value="originalFileName", required=true) String originalFileName,
			@RequestParam(value="systemFileName", required=true)String systemFileName) throws Exception{
				
			ModelAndView mv = new ModelAndView();
			mv.addObject("originalFileName", originalFileName);
			mv.addObject("systemFileName", systemFileName);
			mv.setViewName("download");
			return mv;
		
	}*/
}
