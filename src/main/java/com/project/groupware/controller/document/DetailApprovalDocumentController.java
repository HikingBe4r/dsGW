/**
 * 결재 문서 상세조회 컨트롤러.
 * 해당 문서의 정보를 상세조회한다.
 * 선택한 문서의 id를 통해서 읽어낸다.
 */

package com.project.groupware.controller.document;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class DetailApprovalDocumentController {
	
	
	@RequestMapping(value="/detailApprovalDocument.do", method=RequestMethod.GET)
	public ModelAndView detailApprovalDocument() {
		ModelAndView mv = new ModelAndView();
		
		
		
		return mv;
	}	
}
