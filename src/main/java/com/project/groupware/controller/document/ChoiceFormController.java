package com.project.groupware.controller.document;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.service.FormService;

@Controller
public class ChoiceFormController {

	@Autowired
	private FormService formService;
	
	
	@RequestMapping(value="/choiceForm.do", method=RequestMethod.GET)
	public ModelAndView choiceForm(@RequestParam(value="keyword", required=false) String keyword) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		
		mv.addObject("formList", formService.retrieveFormList(map));
		mv.setViewName("approvalNav/document/choiceForm");
		
		return mv;
	}
	
	
	
	
}
