<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js?ver=23"></script>
<script>
	$(document).ready(function() {
		alert("등록성공");
		document.location.href = "${pageContext.request.contextPath}/listForm.do?board=1";
	});
</script>