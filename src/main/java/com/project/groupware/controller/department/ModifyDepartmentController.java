package com.project.groupware.controller.department;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.groupware.service.DepartmentService;

@Controller
public class ModifyDepartmentController {

	@Autowired
	private DepartmentService service;
	
	@RequestMapping(value="/modifyDepartment.do", method=RequestMethod.POST)
	public String submit(@RequestParam(value="departmentEmpList") List<String> departmentEmpList, @RequestParam(value="departmentId") String deptId){
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(departmentEmpList.size() == 1 && departmentEmpList.get(0).length() == 2) {
			departmentEmpList.clear();
		}
		
		for(int i=0; i<departmentEmpList.size(); i++) {
			String departmentEmp = departmentEmpList.get(i);
			if(departmentEmpList.size() == 1){
				departmentEmp = departmentEmp.substring(2,departmentEmp.length()-2);
			} else if(i==0) {
				departmentEmp = departmentEmp.substring(2,departmentEmp.length()-1);
			} else if(i == departmentEmpList.size() - 1) {
				departmentEmp = departmentEmp.substring(1,departmentEmp.length()-2);
			} else {
				departmentEmp = departmentEmp.substring(1,departmentEmp.length()-1);
			}
			departmentEmpList.set(i, departmentEmp);
		}
		map.put("deptid", deptId);
		map.put("emplist", departmentEmpList);
		
		service.modifyDepartment(map);
		
		return "jsonView";
	}
}
