<%-- modifyArticle.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.project.groupware.domain.ArticleVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

<script> 
	$(document).ready(function() {
		
		//파일 번호
		var array = []; 
		$(':button').click(function() {
			array.push($(this).attr('id'));
			$(this).parentsUntil('tr').html('<td>파일&nbsp;<input type="file" name="upload" size="20">${pageScope.files.originalFileName}</td>');
			$('#fileNo').val(array.join(','));
		});
		
		//공개여부 체크박스
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
	<form action="${pageContext.request.contextPath}/modifyQnA.do"	method="post" enctype="multipart/form-data">
		<input type="hidden" name="fileNo" value="${param.fileNo}" id="fileNo">
		<input type="hidden" name="id" value="${requestScope.article.id}">
		 <input type="hidden" name="secret" value="${param.secret}">
		
		<table style="border: 0px;">
			<tr>
				<td>제목&nbsp;<input type="text" name="subject" size="100" value="${requestScope.article.subject}"></td>
			</tr>
			<tr>
				<td>문의내용<input id="secret" type="checkbox"><td>
			</tr>
			<tr>
				<td><textarea name="content" cols="107" rows="20">${requestScope.article.content}</textarea></td>
			</tr>
			<c:forEach var="files" items="${requestScope.article.files}" varStatus="loop">
				<tr>
					<td>
						<div id="fileNames" class="col-md-3">${pageScope.files.originalFileName}</div>
						<div class="col-md-2"><button type="button" id="${pageScope.files.id}">삭제</button></div>
					</td>
				</tr>
			</c:forEach>
			<c:set var="fileCount" value="${fn:length(requestScope.article.files) }" scope="page" />
			<c:if test="${pageScope.fileCount < 3}">
				<c:forEach begin="${fn:length(requestScope.article.files) + 1}"	end="3">
					<tr id="uploadForm">
						<td>파일&nbsp;<input type="file" name="upload" size="20">${pageScope.files.originalFileName}</td>
					</tr>
				</c:forEach>
			</c:if>
			<tr align="center">
				<td colspan="2">
					<input type="submit" value="수  정">&nbsp;
					<input type="reset" value="취  소">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>




