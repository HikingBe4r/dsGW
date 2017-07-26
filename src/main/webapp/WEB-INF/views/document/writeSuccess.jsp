<%-- writeSuccess.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

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
