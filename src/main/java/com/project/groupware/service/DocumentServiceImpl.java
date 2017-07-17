package com.project.groupware.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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
	

	public void registerDocument(DocumentVO document) {
		//문서등록
		documentMapper.insertDocument(document);
		
		//파일정보 등록
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
		
		for(int i=0; i<document.getApproverList().size(); i++) {
			System.out.println(i + " " + document.getApproverList().get(i).toString());
		}
		
		
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
	
	/**
	 * 문서 승인처리
	 * 1. apphistory에 승인comment insert한다.
	 * 2-1) 다음번 결재자가 있으면, 알림을 보낸다.
	 * 2-2) 마지막 결재자이면 기안자에게 알림을 보내고, 문서 최종상태를 변경한다.
	 * 
	 * map: DocumentVO, ApprovalHistoryVO, NoticeVO
	 */
	public void approveDocument(Map<String, Object> map) {
		
		
	}
	
	/**
	 * 문서 반려처리
	 * 1. apphistory에 반려 comment를 insert
	 * 2. 기안자에게 문서가 반려됐음을 알림 보내기.
	 * 3. 문서 최종상태 변경
	 */
	public void rejectDocument(DocumentVO documentVO) {
		
	}
	
	
	// 결재문서 목록조회
	public List<Map<String, Object>> retrieveApprovalDocumentList(Map<String, Object> keyword) {
		
		List<Map<String, Object>> documentList = documentMapper.selectApprovalDocumentList(keyword);
		
		return documentList;
	}
	
	// 결재문서 상세조회
	public Map<String, Object> retrieveApprovalDocument(String documentId) {
		Map<String, Object> approvalDocument = new HashMap<String, Object>();
		approvalDocument.put("document", documentMapper.selectApprovalDocument(documentId));
		approvalDocument.put("approverList", approvalLineMapper.selectApproverMapByDocumentId(documentId));
		return approvalDocument;
	}
	
	// 결재선 조회(문서번호로)
	public List<Map<String, Object>> retrieveApproverMapByDocumentId(String documentId) {
		List<Map<String, Object>> approverList = approvalLineMapper.selectApproverMapByDocumentId(documentId);
		
		return approverList;
	}
}
