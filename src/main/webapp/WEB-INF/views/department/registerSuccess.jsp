<%-- findEmployeeId.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script>
	alert("부서 등록이 완료되었습니다.");
	opener.parent.location.reload();
	window.close();
</script>
