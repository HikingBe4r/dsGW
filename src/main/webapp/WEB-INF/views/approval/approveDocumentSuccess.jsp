<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>

<script>
	$(document).ready() {
		$("#approveBtn").click(function() {
			var form = $("#approveForm");
			form.method = "POST";
			form.action = "${pageContext.request.contextPath}/approveDocument.do";
		});
	}
</script>

<form id="approveForm">
	<div class="form-group">
		<textArea id="comment" name="comment" cols="100" rows="5"></textArea>
	</div>

	<div class="btn-group pull-right">
		<button class="btn btn-default" type="button" id="approveBtn">승인</button>
	</div>
</form>