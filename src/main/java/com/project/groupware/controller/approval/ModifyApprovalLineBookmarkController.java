package com.project.groupware.controller.approval;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.groupware.domain.ApproverVO;
import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.service.DocumentService;

@Controller
public class ModifyApprovalLineBookmarkController {
	
	@Autowired
	private DocumentService documentService;
	
	@RequestMapping(value="/modifyApprovalLineBookmark.do", method=RequestMethod.GET)
	public String form() {	
		return "approvalNav/approval/modifyApprovalLineBookmark";
	}
	
	
	@RequestMapping(value="/modifyApprovalLineBookmark.do", method=RequestMethod.POST)
	public String submit(@RequestParam(value="approvalLineId") String approvalLineId,
						 @RequestParam(value="approverEmpIdList") List<String> approverEmpIdList,
						 @RequestParam(value="recieverEmpIdList") List<String> recieverIdList,
						 HttpServletRequest request){
		
		List<ApproverVO> approverList = new ArrayList<ApproverVO>();
		if(approverEmpIdList.size() == 1 && approverEmpIdList.get(0).length() == 2) {
			approverEmpIdList.clear();
		}
		if(recieverIdList.size() == 1 && recieverIdList.get(0).length() == 2) {
			recieverIdList.clear();
		}
		
		HttpSession session = request.getSession();
		ApproverVO writer = new ApproverVO();
		EmployeeVO employee = (EmployeeVO)session.getAttribute("employee");
		writer.setEmployeeId(employee.getId());
		writer.setStep(1);
		writer.setApprovalAuthId("1");
		approverList.add(writer);
		
		
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
			approverList.add(approver);
		}
		
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
			approverList.add(approver);	
		}			
			
		documentService.modifyApproverList(approvalLineId, approverList);
		
		return "jsonView";
	}

}