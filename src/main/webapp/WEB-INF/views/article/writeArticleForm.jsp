<%-- writeArticleForm.jsp --%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="//code.jquery.com/jquery.min.js"></script>
<script
   src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

 <script>

//취소 버튼
$(document).ready(function() {   
	$("#cancel").click(function() {
		location.href	= 'listArticleForm.do?boardId=${param.boardId}&open=${param.open}';
	});
});
</script>
<html>
	<head>
		<title>게시글 쓰기 화면</title>
	</head>
	<body>
	<h3>게시글 쓰기 화면</h3>
	<form action="${pageContext.request.contextPath }/writeArticle.do"  method="post" enctype="multipart/form-data">
	<input type="hidden" name="boardId" value="${param.boardId}"> 
	<input type="hidden" name=secret value="${param.secret}">
	<table border="1">
	<tr>
			<td>제목</td>
			<td><input type="text" name="subject" size="148"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="content" cols="150" rows="20"></textarea></td>
		</tr>
		<tr>
			<td>파일#1 </td>	
			<td><input type="file" name="upload"></td>
		</tr>
		<tr>
			<td>파일#2 </td>
			<td><input type="file" name="upload"></td>
		</tr>
		<tr>
			<td>파일#3 </td>
			<td><input type="file" name="upload"></td>
		</tr>	
		<tr align="center">
			<td colspan="2">
				<input type="submit" value="확인">&nbsp;
				<button type="button" id="cancel">취소</button>
			</td>
		</tr>

	</table>
	</form>
	</body>
</html>




