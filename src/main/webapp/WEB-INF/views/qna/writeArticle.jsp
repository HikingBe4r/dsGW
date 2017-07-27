<%-- writeArticleForm.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>


<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function(){
		
		//공개 여부 설정
		$('#secret').on('click', function(){
			
			if($(this).prop('checked')) {
				$('input[name=secret]').val("1");
			} else {
				$('input[name=secret]').val("0");	
			}
			console.log($('input[name=secret]').val());
		});
	});
	
</script>

<html>
<head>
<title>Q&A 게시판</title>
</head>
<body>
	<h3>Q&A</h3>
	<form action="${pageContext.request.contextPath }/writeArticle.do"	method="post" enctype="multipart/form-data">
		<input type="hidden" name="boardId" value="${param.boardId}">
		<input type="hidden" name="secret" value="0">
		<table style="border: 0px;">

			<tr>
				<td>제목&nbsp;<input type="text" name="subject" size="100"></td>
			</tr>
			<tr>
				<td>문의내용<input id="secret" type="checkbox"><td>
			</tr>
			<tr>
				<td><textarea name="content" cols="107" rows="20"></textarea></td>
			</tr>
			<tr>
				<td>파일#1&nbsp;<input type="file" name="upload"></td>
			</tr>
			<tr>
				<td>파일#2&nbsp;<input type="file" name="upload"></td>
			</tr>
			<tr>
				<td>파일#3&nbsp;<input type="file" name="upload"></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="submit" value="등  록">&nbsp;
					<input type="reset" value="취  소"></td>
			</tr>
		</table>
	</form>
</body>
</html>




