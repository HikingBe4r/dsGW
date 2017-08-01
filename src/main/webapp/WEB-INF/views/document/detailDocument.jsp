<%-- writeDocument.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<script	src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
	$(document).ready(function() { 
		var form = document.detailDocumentForm;
		// 결재선 버튼 클릭시 팝업
		$('#approvalLine').click(function() {
			window.open('', 'Popup_Window', 'width=800, height=420');
			form.target = "Popup_Window";
			form.action = "${pageContext.request.contextPath}/listApprover.do";
			form.submit();
		});
		
		// 취소버튼 -> 목록으로 가기
		$('#cancelBtn').click(function() {
			history.back();
			//document.location.href = "${pageContext.request.contextPath}/listApprovalDocument.do";
		}); 
		
		// 승인버튼
		$('#approveDocument').click(function() {
			$("#kind").val("1");	// hidden의 kind값 변경
			window.open('', 'Popup_Window', 'width=300, height=170');
			form.target = "Popup_Window";
			form.action = "${pageContext.request.contextPath}/approveDocument.do";
			form.method = "GET";
			form.submit();
		});
		
		// 반려버튼
		$('#rejectDocument').click(function() {
			$("#kind").val("2");
			window.open('', 'Popup_Window', 'width=300, height=170');
			form.target = "Popup_Window";
			form.action = "${pageContext.request.contextPath}/approveDocument.do";
			form.method = "GET";
			form.submit();
		});
		
		// 재기안버튼
		$('#rewriteDocument').click(function() {
			var content = '${requestScope.approvalDocument.document.content }';
			var htmlStr = "<input type='hidden' name='subject' value='${requestScope.approvalDocument.document.subject }'>";
			htmlStr += "<input type='hidden' name='content' value='";
			htmlStr += content;	
			htmlStr += "'><input type='hidden' name='endDate' value='${requestScope.approvalDocument.document.endDate }'>";
			htmlStr += "<input type='hidden' name='formId' value='${requestScope.approvalDocument.document.formVO.id }'>";	
			$('#rewriteForm').append(htmlStr);
			$("#rewriteForm").submit();
					
		});
		
		
	});
</script>

<form action="${pageContext.request.contextPath }/rewriteDocument.do" method="post" id="rewriteForm"></form>
<form name="detailDocumentForm" id="detailDocumentForm">
	<input type="hidden" name="documentId" id="documentId" value="${requestScope.approvalDocument.document.id }" />
	<input type="hidden" name="kind" id="kind" value="" />
	<div >
		<div class="btn-group" role="group" aria-label="...">
			<button type="button" class="btn btn-default" id="approvalLine">결재선</button>
			<button type="button" class="btn btn-danger" id="cancelBtn">취소</button>
		</div>

		<div class="pull-right">
			<c:if test="${requestScope.approvalDocument.currentApprover.employeeId == sessionScope.employee.id }">
				<button type="button" class="btn btn-primary btn-lg" id="approveDocument">승인</button>
				<button type="button" class="btn btn-primary btn-lg btn-danger" id="rejectDocument">반려</button>
			</c:if> 
			<c:if test="${requestScope.approvalDocument.document.status == 4 &&
						requestScope.approvalDocument.approverList[0].EMPLOYEEID == sessionScope.employee.id}" >	
				<button type="button" class="btn btn-primary btn-lg" id="rewriteDocument">재기안</button>
			</c:if>
			
		</div>
	</div>
	<br>
	<div  id="asdf" class="panel panel-info" style="height: 750px;">
		<div class="panel-heading" align="center">
			<h4 id="azzz"> ${requestScope.approvalDocument.document.formVO.subject}</h4>	
			<input type="hidden" name="formId" value="1">
		</div>

		<div class="panel-body">
			<div class="row">
				<div class="col-sm-3">
					<table class="table table-condensed table-bordered">	
						<tr>
							<td style="width: 100px;">기안자</td>
							<td style="width: 100px;">${requestScope.approvalDocument.approverList[0].EMPLOYEENAME }<input type="hidden" name="employeeId" value="20170711001"></td>
						</tr>
						<tr>
							<td>소속 부서</td>
							<td>${requestScope.approvalDocument.approverList[0].DEPARTMENTNAME }</td>
						</tr>
						<tr>
							<td>문서번호</td>
							<td>${requestScope.approvalDocument.document.id }</td>
						</tr>
						<tr>
							<td>작성일</td>
							<td>${requestScope.approvalDocument.document.writeday }</td>
						</tr>
						<tr>
							<td>시행일</td>
							<td>${requestScope.approvalDocument.document.endDate }</td>
						</tr>
					</table>
				</div>
				<div class="col-sm-${9 - requestScope.approvalDocument.approverList.size() + 1 }"></div>
				
				<div class="col-sm-${requestScope.approvalDocument.approverList.size()-1 }">
					<table class="table table-bordered table-condensed">
						<c:forEach var="i" begin="0" end="1">
							<tr>
							<c:forEach var="j" begin="1" end="${requestScope.approvalDocument.approverList.size()-1 }">
							
							<!-- 현재 결재자칸은 테두리가 빨강. -->
							<!-- 이거는 jquery쓰는게 더 깔끔할거 같은데.. -->
							
								<c:if test="${i == 0 && 
										requestScope.approvalDocument.approverList[j].APPID == 
										requestScope.approvalDocument.currentApprover.id }">
									<td style="width: 100px; color: red;">${requestScope.approvalDocument.approverList[j].EMPLOYEENAME}</td>	
								</c:if>
								<c:if test="${i == 0 && 
										requestScope.approvalDocument.approverList[j].APPID != 
										requestScope.approvalDocument.currentApprover.id }">
									<td style="width: 100px;">${requestScope.approvalDocument.approverList[j].EMPLOYEENAME}</td>	
								</c:if>
							
								<!-- 
									completeApproverList : 해당문서를 결재한 결재자 리스트
									approverList : 해당문서의 결재자 리스트
								 -->
								 
								 <!-- completeApproverList에 있는 결재자와 approverList에 있는 결재자가 같으면 직인을 넣는다. -->
								<c:if test="${i == 1 && 
									j <= requestScope.approvalDocument.completeApproverList.size() &&
									requestScope.approvalDocument.completeApproverList[j-1].APPID == 
										requestScope.approvalDocument.approverList[j].APPID }">
									<td style="height: 100px; width: 100px">
										<img src="${pageContext.request.contextPath }/upload/empImage/${requestScope.approvalDocument.approverList[j].IMAGE}" style="width: 90px; height:90px;" />
									</td>	
								</c:if>
								
								<!-- completeApproverList에 있는 결재자와 approverList에 있는 결재자가 다르면 직인을 안 넣는다. -->
								<c:if test="${i == 1 && 
									j > requestScope.approvalDocument.completeApproverList.size() }">
									<td style="height: 100px; width: 100px"></td>	
								</c:if>
							
							</c:forEach>
							</tr>
						</c:forEach>
						
					</table>
				</div>
				<div class="col-sm-1"></div>
			</div>

				<div class="form-group">
					<table>
						<tr class="col-sm-10">
							<td style="width: 50px; height:50px;" align="right">
								<label style="margin-right: 20px">제목</label> 
							</td>
							<td>
								<input type="text" class="form-control" id="subject" name="subject"
									placeholder="문서제목" readonly="readonly" value="${requestScope.approvalDocument.document.subject }">
							</td>
						</tr>
						<tr class="col-sm-12">
							<td style="width: 50px; height:50px;" align="right" valign="top">
								<label style="margin-right: 20px">내용</label>
							</td>
							<td style="border">${requestScope.approvalDocument.document.content }</td>
							
						</tr>
					</table>
				</div>
			<br>
			<div class="col-sm-12" style="height: 20px;">
				
			</div>

			<div class="col-sm-10">
				<dl class="dl-horizontal">
					<table>
						<c:forEach var="documentFile" items="${requestScope.approvalDocument.document.documentFileList }" varStatus="loop">
						
							<c:url var="downloadURL" value="/downloadFile.do">
				 				<c:param name="originalFileName" value="${documentFile.originalFileName }"/>
				 				<c:param name="systemFileName" value="${documentFile.systemFileName }"/>
				 				<c:param name="kind" value="document" />
				 			</c:url>
				 			 
							<tr>
								<td style="width: 100px;"><label>첨부파일 ${loop.index+1 }</label></td>
								<td style="width: 300px;"><a href="${downloadURL }">${documentFile.originalFileName }</a></td>
							</tr>
							
						</c:forEach>
					</table>
				</dl>
			</div>
		</div>
	</div>
</form>















