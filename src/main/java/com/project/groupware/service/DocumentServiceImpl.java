package com.project.groupware.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.SystemEnvironmentPropertySource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.groupware.domain.ApprovalHistoryVO;
import com.project.groupware.domain.ApprovalLineVO;
import com.project.groupware.domain.ApproverVO;
import com.project.groupware.domain.BookMarkDocumentVO;
import com.project.groupware.domain.DocumentFileVO;
import com.project.groupware.domain.DocumentVO;
import com.project.groupware.domain.NoticeVO;
import com.project.groupware.persistent.mapper.ApprovalHistoryMapper;
import com.project.groupware.persistent.mapper.ApprovalLineMapper;
import com.project.groupware.persistent.mapper.DocumentFileMapper;
import com.project.groupware.persistent.mapper.DocumentMapper;
import com.project.groupware.persistent.mapper.NoticeMapper;

@Service
public class DocumentServiceImpl implements DocumentService {
	
	@Autowired
	private DocumentMapper documentMapper;
	@Autowired
	private DocumentFileMapper documentFileMapper;
	@Autowired
	private NoticeMapper noticeMapper;
	@Autowired
	private ApprovalHistoryMapper approvalHistoryMapper;
	@Autowired
	private ApprovalLineMapper approvalLineMapper;
	

	
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.DEFAULT, readOnly=false, timeout=-1)
	public void registerDocument(DocumentVO document) {
		//문서등록
		documentMapper.insertDocument(document);
		
		//파일정보 등록
		//System.out.println("documentId : " + document.getId());
		String documentId = document.getId();
		List<DocumentFileVO> documentFileList = document.getDocumentFileList();
		if(documentFileList.size() != 0) {
			for(DocumentFileVO documentFile : documentFileList) {
				documentFile.setDocumentId(documentId);				
			}
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("documentFileList", documentFileList);
			documentFileMapper.insertDocumentFile(map);
			
		}
		
		//결재이력 등록
		ApprovalHistoryVO history = new ApprovalHistoryVO();
		history.setDocumentId(documentId);
		
		//테스트를 위한 결재자 삽입(나중에 삭제할 것)
		ApproverVO approver1 = new ApproverVO();
		approver1.setId("1");
		approver1.setStep(1);
		approver1.setApprovalLineId("1");
		approver1.setApprovalAuthId("1");
		ApproverVO approver2 = new ApproverVO();
		approver2.setId("2");
		approver2.setStep(2);
		approver2.setApprovalLineId("2");
		approver2.setApprovalAuthId("2");
		document.getApproverList().add(approver1);
		document.getApproverList().add(approver2);
		
		
		for(ApproverVO approver : document.getApproverList()) {
			if(approver.getStep() == 1) {
				history.setApproverId(approver.getId());
				break;
			}
		}
		history.setStatus("1");
		history.setReply("기안~~");	
		approvalHistoryMapper.insertApprovalHistory(history);
		
		
		
		//알림
		NoticeVO notice = new NoticeVO();
		notice.setEmployeeId(document.getEmployeeId());
		/*
		 *  알림 내용 설정 
		 */
		notice.setContent("알림 내용 설정해~~");
		noticeMapper.insertNotice(notice);
		
	}

	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.DEFAULT, readOnly=false, timeout=-1)
	public void registerApprovalLine(ApprovalLineVO approvalLine) {
		//결재선 등록
		approvalLineMapper.insertApprovalLine(approvalLine);
		
		//결재자 목록 등록
		for(ApproverVO approver : approvalLine.getApproverList()) {
			approver.setApprovalLineId(approvalLine.getId());
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("approverList", approvalLine.getApproverList()); 
		approvalLineMapper.insertApproverList(map);
		
		
	}

	
	//특정 사원의 결재선 즐겨찾기 조회
	public List<ApprovalLineVO> retrieveApprovalLineList(String employeeId) {
		
		return approvalLineMapper.selectApprovalLineList(employeeId);
		
	}

	
	//특정 결재선의 결재자 목록을 결재순서대로 조회
	public List<ApproverVO> retrieveApproverList(String approvalLineId) {
		
		return approvalLineMapper.selectApproverList(approvalLineId);
		
	}

	
	//특정 결재선의 결재자목록 수정(모두 삭제 후, 새로 추가)
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.DEFAULT, readOnly=false, timeout=-1)
	public void modifyApproverList(String approvalLineId, List<ApproverVO> approverList) {
		//결재자목록 삭제
		approvalLineMapper.deleteApproverList(approvalLineId);

		//결재자목록 추가
		for(ApproverVO approver : approverList) {
			approver.setApprovalLineId(approvalLineId);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("approverList", approverList);
		approvalLineMapper.insertApproverList(map);		
	}

	
	
	
	public List<DocumentVO> retrieveDocumentList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	public void modifyDocument(DocumentVO documentVO) {
		// TODO Auto-generated method stub
		
	}

	public DocumentVO retrieveDocument(String documentId) {
		// TODO Auto-generated method stub
		return null;
	}

	public void registerBookMarkDocument(BookMarkDocumentVO bookMarkDocumentVO) {
		// TODO Auto-generated method stub
		
	}

	public void removeBookMarkDocument(String myDocsId) {
		// TODO Auto-generated method stub
		
	}	
	
	public void approveDocument(DocumentVO documentVO) {
		// TODO Auto-generated method stub
		documentMapper.updateDocumentStatus(documentVO);
		
	}
	public void rejectDocument(DocumentVO documentVO) {
		// TODO Auto-generated method stub
		documentMapper.updateDocumentStatus(documentVO);
	}
	

}
