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
         $(this).parentsUntil('tr').html('<td><input type="file" name="upload" size="20">${pageScope.files.originalFileName}</td>');
         $('#fileNo').val(array.join(','));
      });
            
      
      //공개여부 체크박스
      $('#off').on('click', function(){
         
         if($(this).prop('checked')) {
            $('input[name=off]').val("1");
         } else {
            $('input[name=off]').val("0");
            
         }
         
         console.log($('input[name=off]').val());
      });
   });

</script>
<html>
<head>
<title>Q&A 게시판</title>
</head>
<body>
   <h3>Q&A</h3>
   <form action="${pageContext.request.contextPath}/modifyQnA.do" method="post" enctype="multipart/form-data">
      <input type="hidden" name="fileNo" value="" id="fileNo">
      <input type="hidden" name="id" value="${requestScope.article.id}">
      <input type="hidden" name="off" value="0">
      
      <table style="border: 0px;">
         <tr align="left">
         	<td colspan="2">비공개 설정<input align="right" id="secret" type="checkbox"></td>
         </tr>
         <tr>
            <td colspan="2"><input  class='form-control' type="text" name="subject" size="100" value="${requestScope.article.subject}"></td>
         </tr>
         <tr >
            <td colspan="2"><div><textarea  class='form-control' name="content" cols="107" rows="20">${requestScope.article.content}</textarea></div></td>
         </tr>
         <c:forEach var="files" items="${requestScope.article.files}" varStatus="loop">
            <tr>
               <td colspan="2">
                  <div id="fileNames" class="col-md-3">${pageScope.files.originalFileName}</div>
                  <div class="col-md-2"><button type="button" id="${pageScope.files.id}">삭제</button></div>
               </td>
            </tr>
         </c:forEach>
         <c:set var="fileCount" value="${fn:length(requestScope.article.files) }" scope="page" />
         <c:if test="${pageScope.fileCount < 3}">
            <c:forEach begin="${fn:length(requestScope.article.files) + 1}"   end="3">
               <tr id="uploadForm">
                  <td><input type="file" name="upload" size="20">${pageScope.files.originalFileName}</td>
               </tr>
            </c:forEach>
         </c:if>
         <tr align="center">
            <td colspan="2">
               <input class="btn btn-default" type="submit" value="수  정">&nbsp;
               <input class="btn btn-default" type="reset" value="취  소">
            </td>
         </tr>
      </table>
   </form>
</body>
</html>



