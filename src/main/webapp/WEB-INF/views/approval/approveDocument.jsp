<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<script	src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {
		// 승인버튼
		$("#approveBtn").click(function() {
			
			if($("#comment").val().length == 0) {
				alert("내용을 입력하세요.");
			} else {
				
				$.ajax({
					url: '${pageContext.request.contextPath}/approveDocument.do'
					,
					method: 'POST'
					,
					dataType: 'json'
					,
					data: {
						kind: '${param.kind}',
						employeeId: '${sessionScope.employee.id}',
						reply: $('#comment').val(),
						documentId: '${requestScope.documentId}'
					}
					,
					success: function(data) {
						window.opener.document.location.href='${pageContext.request.contextPath}/listApprovalDocument.do?boardId=3';
						window.close();						
					}
					,
					error : function(jqXHR) {
						window.opener.document.location.href='${pageContext.request.contextPath}/listApprovalDocument.do?boardId=1';
						window.close();
					}					
						
				})
			}
			
		});
		
		$("#backBtn").click(function() {
			window.close();
		});
	});
		
</script>

<form class="form-inline pull-left" id="approveForm">
	<div class="col-md-12">
		<div class="form-group">
			<textArea id="comment" name="comment" cols="30" rows="5"></textArea>
		</div>
	
		<div class="btn-group pull-right">
			<c:if test="${requestScope.kind == 1}">
				<button class="btn btn-primary" type="button" id="approveBtn">승인</button>
			</c:if>
			<c:if test="${requestScope.kind == 2}">
				<button class="btn btn-primary btn-danger" type="button" id="approveBtn">반려</button>
			</c:if>
			
			<button class="btn btn-default" type="button" id="backBtn">취소</button>
		</div>
	</div>
</form>