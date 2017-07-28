<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.project.groupware.domain.ArticleVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="//code.jquery.com/jquery.min.js"></script>
<script
   src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

<script>
   
 
   $(document).ready(function() {
	   	 //일반 파일 삭제
         var array = [];
	   	 
         $('.fileButton').click(function() {
            array.push($(this).attr('id'));
            $(this).parentsUntil('tr').html('<td>파일&nbsp;<input type="file" name="fileUpload" size="20">${pageScope.files.originalFileName}</td>');
            $('#fileId').val(array.join(','));
            console.log('삭제하고자 하는 파일 : ' + $('#fileId').val());            
         }); 
         
         
         //이미지 삭제
         $('.imgButton').click(function() {
            array.push($(this).attr('id'));
            $(this).parentsUntil('tr').html('<td>이미지&nbsp;<input type="file" name="imgUpload" size="20">${pageScope.image.originalImageName}</td>'); 
            $('#imageId').val(array.join(','));
            console.log('삭제하고자 하는 이미지 : ' + $('#imageId').val());      
   });        
   
});

 
</script>



<html>
<head>
</head>
<body>
	<h3 align="center">공지글 쓰기 화면</h3>
	<hr style="border: solid 1px red; width: 50%;">
	<form method="post" action="${pageContext.request.contextPath }/modifyNoticeArticle.do" enctype="multipart/form-data">
		<input type="hidden" name="fileId" value="" id="fileId">
		<input type="hidden" name="imageId" value="" id="imageId">
		<input type="hidden" name="id" value="${requestScope.article.id }">
		
		<table style="border: 0px;">
			<tr>
				<td>제목&nbsp;<input type="text" name="subject" size="100" value="${requestScope.article.subject}"></td>
			</tr>
			<tr>
				<td>문의내용<input type="checkbox"></td>
			</tr>
			<tr>
				<td>
					<textarea name="content" cols="107" rows="20">${requestScope.article.content}</textarea>					
				</td>
			</tr>
			
			<!--  이미지 파일인 경우 -->
			<c:set var="imageCount" value="${fn:length(requestScope.article.image) }" scope="page" />
			<c:if test="${pageScope.imageCount == 0}">
				<tr>
					<td>이미지&nbsp;<input type="file" name="imgUpload" size="20"></td>
				</tr>			
			</c:if>
			
			<c:if test="${pageScope.imageCount != 0}">
				<c:forEach var="file" items="${requestScope.article.image}">
					<tr>
						<td>
							<br>이미지&nbsp;
							<div class="row">
								<div id="imageNames" class="col-md-3">${pageScope.file.originalImageName}</div>
								<div class="col-md-2"><button class="imgButton" id="${pageScope.file.id }">삭제</button>
								</div>
							</div>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			
			<!--  일반 파일인 경우 -->			
			<c:forEach var="files" items="${requestScope.article.files}">
				<tr>
					<td>파일&nbsp;
						<div class="row">
							<div id="fileNames" class="col-md-3">${pageScope.files.originalFileName}</div>
							<div class="col-md-2">
								<!-- <button id=removeFileBtn>삭제</button> -->
								<button class="fileButton" id=${pageScope.files.id}>삭제</button>
							</div>
						</div>
					</td>
				</tr>
			</c:forEach>
			
			<c:set var="fileCount" value="${fn:length(requestScope.article.files) }" scope="page" />
			<c:if test="${pageScope.fileCount < 3}">
				<c:forEach begin="${fn:length(requestScope.article.files) + 1}"
					end="3">
					<tr>
						<td>파일&nbsp;<input type="file" name="fileUpload" size="20">${pageScope.files.originalFileName}</td>
					</tr>
				</c:forEach>
			</c:if>
			
			<tr align="center">
				<td colspan="2"><input type="submit" value="수  정">&nbsp;
					<input type="reset" value="취  소"></td>
			</tr>
		</table>	
	</form>
</body>
</html>




