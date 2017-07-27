<%@ page contentType="text/html; charset=utf-8" %>

<html>
	<head>
	</head>
	<body>
	<h3 align="center">공지글 쓰기 화면</h3>
	<hr style="border: solid 1px red; width: 50%;">
	<form action="${pageContext.request.contextPath }/writeArticle.do"   method="post" enctype="multipart/form-data">>
	<input type="hidden" name="boardId=1" value="${param.boardId}">
	<table border="0" align="center">
		<tr>
			<td>제목</td>
			<td><input type="text" name="subject" size="40"></td>
		</tr>
		<tr>
	
		<tr>
			<td>내용</td>
			<td><textarea name="content" cols="40" rows="15"></textarea><br>
			<input type="file" name="imgUpload" size="27"></td>
			
		</tr>	

		<tr>
			<td>파일</td>
			<td><input type="file" name="fileUpload" size="40"></td>
		</tr>	
		<tr>
			<td>파일</td>
			<td><input type="file" name="fileUpload" size="40"></td>
		</tr>	
		<tr>
			<td>파일</td>
			<td><input type="file" name="fileUpload" size="40"></td>
		</tr>	
		<tr align="center">
			<td colspan="2">
				<input type="submit" value="확인">&nbsp;
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
	</form>
	</body>
</html>




