<%-- writeSuccess.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<script	src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js"></script>
<script>
$(document).ready(function() {
	$('#go').on('click', function() {
		location.href = "detailApprovalDocument.do?documentId=" + ${requestScope.documentId};
	})
	
})	
</script>

<h2>문서등록 완료!</h2>
 <br><br>
<button id="go" class="btn btn-default" type="button">기안문서 확인</button>
