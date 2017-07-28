<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>

<script>
	$(document).ready(function() {
		alert("등록성공");
		document.location.href = "${pageContext.request.contextPath}/listFormForAdmin.do?boardId=1";
	});
</script>