<%-- detailForm.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {
		
		
		/* 
			form 선택을 여러가지 방식으로 할수있는걸 기억하기위해
			두가지 방식으로 구현함.
		*/
		$("#modBtn").click(function() {
			if(confirm("수정하시겠습니까?")) {
				$("#detailForm").attr("action", "${pageContext.request.contextPath}/modifyForm.do");
				$("#detailForm").submit();
			}
		});
		
		$("#removeBtn").click(function() {
			if(confirm("삭제하시겠습니까?")) {
				var form = document.detailForm;
				form.action = "${pageContext.request.contextPath}/removeForm.do";
				form.submit();
			}
		});
		
		$("#listBtn").click(function() {
			location.href = "${pageContext.request.contextPath}/listForm.do";
		});
	});
</script>

<div>
	<h3>양식 상세조회</h3>
</div>
<br>
<br>
<form action="" method="GET" id="detailForm" name="detailForm">
	<input type="hidden" name="formId" value="${requestScope.form.id }"/>
	<div style="height: 550px;">
		<table class="table table-striped">
			<tr>
				<td style="width: 200px;"><label>제목</label></td>
				<td><label id="subject" name="subject">
						${requestScope.form.subject } </label></td>
			</tr>
			<tr>
				<td><label>등록일</label></td>
				<td><label id="writeday" name="writeday" draggable="false">${requestScope.form.writeday }</label>
				</td>
			</tr>
			<tr>
				<td><label>조회수</label></td>
				<td><label id="hitcount" name="hitcount" draggable="false">${requestScope.form.hitcount }</label>
				</td>
			</tr>
			<tr>
				<td><label>첨부파일</label></td>
				<td>${requestScope.form.formFile.originalFileName }</td>
			</tr>
	
			<tr>
				<td valign="top"><label>내용</label></td>
				<td>${requestScope.form.content }</td>
			</tr>
	
		</table>
	</div>
	<div align="right">
		<button type="button" class="btn btn-primary" id="modBtn" name="modBtn">수정</button>
		<button type="button" class="btn btn-danger" id="removeBtn" name="removeBtn">삭제</button>
		<button type="button" class="btn btn-default" id="listBtn" name="listBtn">목록으로</button>
	</div>
</form>


























