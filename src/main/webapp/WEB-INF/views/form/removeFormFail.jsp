<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>

<script>
	$(document).ready(function() {
		alert("삭제 실패: [연관된 문서 존재]");
		document.location.href = "${pageContext.request.contextPath}/listForm.do?boardId=1";
	});
</script>