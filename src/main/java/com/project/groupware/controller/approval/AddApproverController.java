package com.project.groupware.controller.approval;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.groupware.domain.ApprovalLineVO;
import com.project.groupware.domain.ApproverVO;
import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.service.DocumentService;

@Controller
public class AddApproverController {
	
	@Autowired
	private DocumentService documentService;
	
	
	@RequestMapping(value="/addApprover.do", method=RequestMethod.GET)
	public String form() {
		return "approval/addApprover"; 		
	}
	
	
	
	@RequestMapping(value="/addApprover.do", method=RequestMethod.POST)
	public String submit(@RequestParam(value="employeeId", required=true) String employeeId, 
						 @RequestParam(value="subject") String subject,
						 @RequestParam(value="approverEmpIdList") List<String> approverEmpIdList,
						 @RequestParam(value="recieverEmpIdList") List<String> recieverIdList,
						 HttpServletRequest request){ 
				
		
		ApprovalLineVO approvalLine = new ApprovalLineVO();
		approvalLine.setEmployeeId(employeeId);
		if(subject != null && subject.length() != 0) {
			approvalLine.setSubject(subject);
		}	
				
		
		// 빈 배열이 넘어오면 "[]"가 들은 배열이 생성됨.
		// 그래서 빈 배열이 넘어와도 사이즈가 1임.
		// 그래서 그런 배열이 생성되면 사이즈를 0으로 만들어줌 
		if(approverEmpIdList.size() == 1 && approverEmpIdList.get(0).length() == 2) {
			approverEmpIdList.clear();
		}
		if(recieverIdList.size() == 1 && recieverIdList.get(0).length() == 2) {
			recieverIdList.clear();
		}
		
		//기안자 결재선에 추가
		HttpSession session = request.getSession();
		ApproverVO writer = new ApproverVO();
		EmployeeVO employee = (EmployeeVO)session.getAttribute("employee");
		writer.setEmployeeId(employee.getId());
		writer.setStep(1);
		writer.setApprovalAuthId("1");
		approvalLine.addApprover(writer);
		
		
		//결재자 결재선에 추가
		for(int i=0; i<approverEmpIdList.size(); i++) {
			String approverEmpId = approverEmpIdList.get(i);
			if(approverEmpIdList.size() == 1){
				approverEmpId = approverEmpId.substring(2,approverEmpId.length()-2);
			} else if(i==0) {
				approverEmpId = approverEmpId.substring(2,approverEmpId.length()-1);
			} else if(i == approverEmpIdList.size() - 1) {
				approverEmpId = approverEmpId.substring(1,approverEmpId.length()-2);
			} else {
				approverEmpId = approverEmpId.substring(1,approverEmpId.length()-1);
			}
			ApproverVO approver = new ApproverVO();
			approver.setEmployeeId(approverEmpId);	
			approver.setStep(i+2); //넘어온 리스트가 스텝순서대로 정렬되어 있다는 가정하에
			approver.setApprovalAuthId("2"); //권한 : 결재
			approvalLine.addApprover(approver);
			
		}
		
		//수신자 결재선에 추가
		for(int i=0; i<recieverIdList.size(); i++) {
			String recieverId = recieverIdList.get(i);
			if(recieverIdList.size() == 1) {
				recieverId = recieverId.substring(2,recieverId.length()-2);
			} else if(i==0) {
				recieverId = recieverId.substring(2,recieverId.length()-1);
			} else if(i == recieverIdList.size() - 1) {
				recieverId = recieverId.substring(1,recieverId.length()-2);
			} else {
				recieverId = recieverId.substring(1,recieverId.length()-1);
			}
			
			ApproverVO approver = new ApproverVO();
			approver.setEmployeeId(recieverId);
			approver.setStep(0); // 수신자 : 0
			approver.setApprovalAuthId("3"); //권한 : 수신
			approvalLine.addApprover(approver);		
		}			
		
		documentService.registerApprovalLine(approvalLine);	
		
		String approvalLineId = approvalLine.getId();
		List<ApproverVO> approverList = approvalLine.getApproverList();	// 객체에 담겨있는 리스트
		List<ApproverVO> approverListAtDb = documentService.retrieveApproverList(approvalLineId); //DB에 저장된 리스트
			
		for(int i=0; i<approverList.size(); i++) {
			String approverId = approverList.get(i).getEmployeeId();
			for(int j=0; j<approverListAtDb.size(); j++) {
				if(approverId.equals(approverListAtDb.get(j).getEmployeeId())) {		
					approverList.get(i).setId(approverListAtDb.get(j).getId());
					break;
				}
			}
		}
		
			
		session.setAttribute("approvalLine", approvalLine);
		
		return "jsonView"; 		
	}

}




