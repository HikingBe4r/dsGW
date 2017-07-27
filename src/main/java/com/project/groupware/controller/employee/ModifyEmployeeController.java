package com.project.groupware.controller.employee;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.EmployeeImageVO;
import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.service.DepartmentService;
import com.project.groupware.service.EmployeeService;
import com.project.groupware.util.UploadFileUtils;

@Controller
public class ModifyEmployeeController {

	@Autowired
	private EmployeeService service;

	@Autowired
	private DepartmentService deptService;

	@RequestMapping(value = "/modifyAdmin.do", method = RequestMethod.GET)
	public String adminForm(@RequestParam(value = "id") String id, Model model) {
		Map<String, Object> keyword = new HashMap<String, Object>();
		model.addAttribute("findEmployee", service.retrieveEmployee(id));
		model.addAttribute("deptList", deptService.retrieveDepartmentList(keyword));
		model.addAttribute("gradeList", service.retrieveGradeList());
		model.addAttribute("statusList", service.retrieveStatusList());
		
		keyword.put("employeeVO", service.retrieveEmployee(id));
		keyword.put("kind", "1");
		model.addAttribute("empImage", service.retrieveEmployeeImage(keyword));
		keyword.clear();
		
		keyword.put("employeeVO", service.retrieveEmployee(id));
		keyword.put("kind", "2");
		model.addAttribute("empImage2", service.retrieveEmployeeImage(keyword));
		
		return "adminNav/employee/modifyAdminForm";
	}
	
	@RequestMapping(value = "/modifyEmployee.do", method = RequestMethod.GET)
	public String empForm(@RequestParam(value = "id") String id, Model model) {
		Map<String, Object> keyword = new HashMap<String, Object>();
		model.addAttribute("findEmployee", service.retrieveEmployee(id));
		model.addAttribute("deptList", deptService.retrieveDepartmentList(keyword));
		model.addAttribute("gradeList", service.retrieveGradeList());
		model.addAttribute("statusList", service.retrieveStatusList());
		
		keyword.put("employeeVO", service.retrieveEmployee(id));
		keyword.put("kind", "1");
		model.addAttribute("empImage", service.retrieveEmployeeImage(keyword));
		keyword.clear();
		
		keyword.put("employeeVO", service.retrieveEmployee(id));
		keyword.put("kind", "2");
		model.addAttribute("empImage2", service.retrieveEmployeeImage(keyword));
		
		return "employee/modifyEmployeeForm";
	}

	@RequestMapping(value = "/modifyAdmin.do", method = RequestMethod.POST)
	public String adminSubmit(@ModelAttribute(value = "findEmployee") EmployeeVO emp, HttpServletRequest request, HttpSession session) throws Exception{
		
		List<MultipartFile> files = emp.getUpload();
		for (MultipartFile file : files) {
			if (!file.isEmpty()) {
				EmployeeImageVO image = UploadFileUtils.uploadImageFile(file, request);
				emp.addImageFile(image);
			}
		}
		service.modifyEmployee(emp);
		
		return "redirect:/listEmployee.do";
	}
	
	@RequestMapping(value = "/successEmployee.do", method = RequestMethod.POST)
	public ModelAndView employeeSubmit(@ModelAttribute(value = "findEmployee") EmployeeVO emp, HttpServletRequest request, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<MultipartFile> files = emp.getUpload();
		for (MultipartFile file : files) {
			if (!file.isEmpty()) {
				EmployeeImageVO image = UploadFileUtils.uploadImageFile(file, request);
				emp.addImageFile(image);
			}
		}
		service.modifyEmployee(emp);
		
		mv.setViewName("employee/successEmployee");
		return mv;
		
	}
}
