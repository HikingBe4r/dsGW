<%-- registerForm.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js?ver=3"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js?ver=23"></script>

<script>

	$(document).ready(function() {
		
		$("#regBtn").click(function() {
			if ($('#subject') == null || $('#subject').val() == '') {
				alert("제목을 입력하세요.");
			} else if ($('#content') == null || $('#content').val() == '') {
				alert("내용을 입력하세요.");
			} else if ($('#upload').val() == '') {
				alert("파일을 첨부하세요.");
			} 
			else {
				$("#regForm").submit();
			}
		});
		
		$("#listBtn").click(function() {
			document.location.href='${pageContext.request.contextPath}/listForm.do';
		});
	});
</script>


<div>
	<h3>양식 등록</h3>
</div>
<br>
<br>

<form action="${pageContext.request.contextPath}/registerForm.do" 
	method="POST" id="regForm" name="regForm" enctype="multipart/form-data">
	<div style="height: 550px;">

		<table class="table table-striped">
			<tr>
				<td style="width: 200px;"><label>제목</label></td>
				<td><input type="text" id="subject" name="subject"/></td>
			</tr>
			<tr>
				<td><label>첨부파일</label></td>
				<td><input type="file" id="upload" name="upload"/></td>
			</tr>

			<tr>
				<td valign="top"><label>내용</label></td>
				<td><textarea id="content" name="content" rows="10" cols="80"></textarea></td>
			</tr>
		</table>
	</div>
	
	<div align="right">
		<button type="button" class="btn btn-primary" id="regBtn" name="regBtn">등록</button>
		<button type="button" class="btn btn-default" id="listBtn" name="listBtn">목록으로</button>
	</div>

</form>























