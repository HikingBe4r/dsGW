package com.project.groupware.controller.tempdocument;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.domain.PagingVO;
import com.project.groupware.domain.TempDocumentVO;
import com.project.groupware.service.TempDocumentService;

@Controller
public class ListTempDocumentController {
	
	@Autowired
	private TempDocumentService tempDocumentService;
	
	@RequestMapping(value="/listTempDocument.do", method=RequestMethod.GET)
	public ModelAndView listTempDocument(HttpServletRequest request/*,
											@RequestParam(value="currentPage", required=false) Integer currentPage*/) {
		
		HttpSession session = request.getSession();
		EmployeeVO employee = (EmployeeVO)session.getAttribute("employee");
		
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String employeeId = employee.getId();
		
		map.put("employeeId", employeeId);
		map.put("startDay", "all");
		map.put("endDay", "all");
		
		//  페이징 처리 시작
		/*if(currentPage == null) {
			currentPage = 1; // param이 비어있으면 현재페이지 = 첫페이지 
		}

		PagingVO paging = new PagingVO(currentPage, tempDocumentService.retrieveTempDocumentList(map).size());
				
		mv.addObject("paging", paging);*/
		//  페이징 처리 끝
		
		mv.addObject("tempDocumentList", tempDocumentService.retrieveTempDocumentList(map));
		mv.setViewName("approvalNav/tempdocument/listTempDocument");
		
		return mv;
		
	}
	
	@RequestMapping(value="/searchTempDocument.do", method=RequestMethod.GET)
	public ModelAndView searchTempDocument(HttpServletRequest request,
											@RequestParam(value="keyfield", required=false) String keyfield,
											@RequestParam(value="keyword", required=false) String keyword,
											@RequestParam(value="startDay", required=false, defaultValue="all") String startDay,
											@RequestParam(value="endDay", required=false, defaultValue="all") String endDay,
											@RequestParam(value="currentPage", required=false) Integer currentPage) {
		
		HttpSession session = request.getSession();		
		EmployeeVO employee = (EmployeeVO)session.getAttribute("employee");
		
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String employeeId = employee.getId();
		
		map.put("employeeId", employeeId);
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		map.put("startDay", startDay);
		map.put("endDay", endDay);		
		
		//  페이징 처리 시작
		if(currentPage == null) {
			currentPage = 1; // param이 비어있으면 현재페이지 = 첫페이지 
		}

		PagingVO paging = new PagingVO(currentPage, tempDocumentService.retrieveTempDocumentList(map).size());
		
		mv.addObject("paging", paging);
		
		session.setAttribute("currentPage", currentPage);
		//  페이징 처리 끝
		
		mv.addObject("tempDocumentList", tempDocumentService.retrieveTempDocumentList(map));
		mv.setViewName("jsonView");
		
		return mv;
		
	}
	
	@RequestMapping(value="/deleteTempDocument.do", method=RequestMethod.GET)
	public String deleteTempDocument(HttpServletRequest request, Model model,
										@RequestParam(value="keyfield", required=false) String keyfield,
										@RequestParam(value="keyword", required=false) String keyword,
										@RequestParam(value="startDay", required=false, defaultValue="all") String startDay,
										@RequestParam(value="endDay", required=false, defaultValue="all") String endDay,
										@RequestParam(value="checkRow", required=false) String checkRow/*,
										@RequestParam(value="currentPage", required=false) Integer currentPage*/) {
				
		String[] tempDocumentIds = checkRow.split(", ");
		
		List<Integer> tempDocumentIdList = new ArrayList<Integer>();
		
		for (String tempDocumentId : tempDocumentIds) {
			tempDocumentIdList.add(Integer.parseInt(tempDocumentId));
		}
		
		Map<String, Object> map1 = new HashMap<String, Object>();
		
		map1.put("tempDocumentIdList", tempDocumentIdList);
		
		tempDocumentService.removeTempDocument(map1);
		
		HttpSession session = request.getSession();
		EmployeeVO employee = (EmployeeVO)session.getAttribute("employee");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String employeeId = employee.getId();
		
		map.put("employeeId", employeeId);
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		map.put("startDay", startDay);
		map.put("endDay", endDay);
		
		//  페이징 처리 시작
		Integer currentPage = (Integer)session.getAttribute("currentPage");
		
		if(currentPage == null) {
			currentPage = 1; // param이 비어있으면 현재페이지 = 첫페이지 
		}

		PagingVO paging = new PagingVO(currentPage, tempDocumentService.retrieveTempDocumentList(map).size());
		
		model.addAttribute("paging", paging);
		//  페이징 처리 끝
		
		model.addAttribute("tempDocumentList", tempDocumentService.retrieveTempDocumentList(map));
		
		return "jsonView";
		
	}
	
	@RequestMapping(value="/deleteTempDocument.do", method=RequestMethod.POST)
	public String deleteTempDocument(@ModelAttribute(value="tempDocumentVO") TempDocumentVO tempDocumentVO, Model model) {
		
		List<Integer> tempDocumentId = new ArrayList<Integer>();
		
		tempDocumentId.add(Integer.parseInt(tempDocumentVO.getId()));
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("tempDocumentIdList", tempDocumentId);
		
		tempDocumentService.removeTempDocument(map);
		
		return "redirect:/listTempDocument.do";
		
	}
	
}