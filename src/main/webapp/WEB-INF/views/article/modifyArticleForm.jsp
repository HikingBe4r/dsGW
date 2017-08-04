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
          var array = []; 
         $(':button').click(function() {
            array.push($(this).attr('id'));
            $(this).parentsUntil('tr').html('<td>파일&nbsp;<input type="file" name="upload" size="20">${pageScope.files.originalFileName}</td>');
            $('#fileNo').val(array.join(','));
            console.log('삭제하고자 하는 파일 : ' + $('#fileNo').val());      
			
         }); 
         	
         $("#cancel").click(function() {
     		location.href	= 'detailArticle.do?id=${param.id}&boardId=${param.boardId}';
     	});
   });
 
</script>


<html>
<head>
<title>일반 게시판</title>
</head>
<body>
   <h3>일반 게시판</h3>
   <form action="${pageContext.request.contextPath}/modifyArticle.do"  method="post" enctype="multipart/form-data">
      <input type="hidden" name="fileNo" value="" id="fileNo">
      <input type="hidden" name="id" value="${requestScope.article.id}">
      <input type="hidden" name="boardId" value="${param.boardId}">
      <table style="border: 0px;">

         <tr>
            <td>제목&nbsp;<input type="text" name="subject" size="100"
               value="${requestScope.article.subject}"></td>
         </tr>
         <tr>
            <td>내용<input type="checkbox"></td>
         </tr>
         <tr>
            <td><textarea name="content" cols="107" rows="20">${requestScope.article.content}</textarea></td>
         </tr>
         <c:forEach var="files" items="${requestScope.article.files}" varStatus="loop">
            <tr>
               <td>
                  <div id="fileNames${loop.index}" class="col-md-3">${pageScope.files.originalFileName}</div>
                  <div class="col-md-2"><button type="button" id="${pageScope.files.id}">삭제</button></div>
               </td>
            </tr>
         </c:forEach>
         <c:set var="fileCount" value="${fn:length(requestScope.article.files) }" scope="page" />
         <c:if test="${pageScope.fileCount < 3}">
            <c:forEach begin="${fn:length(requestScope.article.files) + 1}"   end="3">
               <tr id="uploadForm">
                  <td>파일&nbsp;<input type="file" name="upload" size="20">${pageScope.files.originalFileName}</td>
               </tr>
            </c:forEach>
         </c:if>
         <tr align="center">
            <td colspan="2">
               <input type="submit" value="수  정">&nbsp;
               <button type="button" id="cancel">취소</button>
         </tr>
      </table>
   </form>
</body>
</html>



