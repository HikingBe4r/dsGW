<%-- 
 listArticle.jsp 
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.project.groupware.domain.ArticleVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script>
	$(document).ready(function() {
		//글쓰기 
		$('#writeBtn').click(function() {
			location.href = "${pageContext.request.contextPath}/writeArticle.do?boardId=${param.boardId}";					
		});
		
		
	
	});
	

</script>


<html lang="en">
<a></a>
<div class="panel panel-default">
   <div class="panel-body">일반 게시판</div>
</div>
<div>

   
   <form action="${pageContext.request.contextPath}/searchArticle.do" method="get" class="form-inline pull-right">
      <input type="hidden" name="boardId" value="${param.boardId}">
       <select class="form-control">
         <option>부서</option>
         <c:forEach var="department" items="${requestScope.departments }"
            varStatus="loop">
            <option>${department.name}</option>
         </c:forEach>
      </select> 
         <select name="keyfield" class="form-control">
            <option value="subject">제목</option>
            <option value="name">작성자</option>
            <option value="content">내용</option>

         </select>


      <div class="form-group">
         <input type="text" class="form-control" name="keyword">

      </div>      
         <button type="submit" class="btn btn-default" id="searchBtn">검색</button>
   </form>


   
</div>
<br>
<br>


<div style="height: 550px;">
   <div class="checkbox">
      <table class="table table-hover" align="center">

         <thead>
            <tr>
               <!-- <th width="50"></th> -->
               <th width="100">번호</th>
               <th>제목</th>
               <th width="200">이름</th>
               <th width="200">날짜</th>
               <th width="100">조회수</th>
               <th width="100">파일</th>
            </tr>
         </thead>


         <c:forEach var="article" items="${requestScope.articles}"
            varStatus="loop">
            <c:url var="url" value="/detailArticle.do">            
               <c:param name="id" value="${pageScope.article.id }" />
			   <c:param name="boardId" value="${param.boardId }" />
            </c:url>
            
            
            <tr>
               <td>${requestScope.paging.num - loop.index }</td>
               <td>${pageScope.article.id }<a href="${pageScope.url }">${pageScope.article.subject }</a></td>
               <td>${pageScope.article.employee.name }</td>
               <td>${pageScope.article.writeday }</td>
               <td>${pageScope.article.hitcount }</td>
               <td><c:if test="${pageScope.article.count != 0}">
                     <span class="glyphicon glyphicon-save" aria-hidden="true"></span>
                  </c:if></td>

            </tr>
         </c:forEach>


      </table>
   </div>
</div>

<!-- 페이징 처리 -->

<div class="col-md-12" align="center">
   <ul id="pagination" class="pagination">
      <li><a href="#" aria-label="Previous"> <span
            aria-hidden="true">&laquo;</span>
      </a></li>

      <!-- 이전 -->
      <c:if test="${requestScope.paging.prevPage > 0 }">
         <c:url var="prevUrl" value="/searchArticle.do">
            <c:param name="boardId" value="${param.boardId}" />
            <c:param name="currentPage" value="${requestScope.paging.prevPage}" />
            <c:param name="keyfield" value="${param.keyfield}" />   
             <c:param name="keyword" value="${param.keyword}" />             
         </c:url>
         <a href="${prevUrl}"> [이전] </a>
      </c:if>


      <!-- 현재 -->

      <c:forEach var="pageNum" begin="${requestScope.paging.startPage}"
         end="${requestScope.paging.endPage}">
         <c:if test="${pageScope.pageNum != requestScope.paging.currentPage }">
               <c:url var="url" value="/searchArticle.do">
                  <c:param name="boardId" value="${param.boardId}" />
                  <c:param name="currentPage" value="${pageScope.pageNum}" />
                  <c:param name="keyfield" value="${param.keyfield}" />   
                   <c:param name="keyword" value="${param.keyword}" />             
               </c:url>
               <a href="${url}">${pageScope.pageNum }</a>
         </c:if>
         <c:if test="${pageScope.pageNum == requestScope.paging.currentPage }">
                   ${pageScope.pageNum }         
          </c:if>
      </c:forEach>


      <!-- 다음 -->

      <c:if test="${requestScope.paging.nextPage <= requestScope.paging.totalPage }">
         <c:url var="nextUrl" value="/searchArticle.do">
            <c:param name="boardId" value="${param.boardId}" />
            <c:param name="currentPage" value="${requestScope.paging.nextPage}" />
            <c:param name="keyfield" value="${param.keyfield}" />   
             <c:param name="keyword" value="${param.keyword}" />             
         </c:url>
         <a href="${nextUrl}"> [다음]</a>
      </c:if>


      <!-- <li><a href="#">1</a></li>
      <li><a href="#">2</a></li>
      <li><a href="#">3</a></li>
      <li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
      </a></li>  -->
   </ul>
   <div class="pull-right">
      <button type="button" class="btn btn-default">삭제</button>
      <button type="button" class="btn btn-default" id="writeBtn">글쓰기</button>
   </div>
</div>

</html>













 --%>