<%-- listDocument.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script type="text/javascript" src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script>

	$(function() {
	    $( "#startDay" ).datepicker({
	    	dateFormat : "yy/mm/dd",
	    	changeMonth: true,
	    	changeYear: true,
	    	showOn: "both", 
	        buttonImage: "resources/image/calendar6.png" 
	    });
	});
	
	$(function() {
	    $( "#endDay" ).datepicker({
	    	dateFormat : "yy/mm/dd",
	    	changeMonth: true,
	    	changeYear: true,
	    	showOn: "both", 
	        buttonImage: "resources/image/calendar6.png" 
	    });
	});

</script>

<div>
	<c:choose>
		<c:when test="${requestScope.myDocs == 1}">
			<h3>개인문서 목록</h3>
		</c:when>
		<c:when test="${requestScope.status == 3 and requestScope.myDocs == 2}">
			<h3>승인문서 목록</h3>
		</c:when>
		<c:when test="${requestScope.status == 4 and requestScope.myDocs == 2}">
			<h3>반려문서 목록</h3>
		</c:when>
		<c:when test="${requestScope.status == 5 and requestScope.myDocs == 2}">
			<h3>수신문서 목록</h3>
		</c:when>
	</c:choose>
	<form class="form-inline pull-right" action="${pageContext.request.contextPath }/listDocument.do" method="get">
		<div class="form-group">
			날짜검색 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="searchDay" value="all" checked="checked">전체&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="searchDay" value="writeDay">작성일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="searchDay" value="finishDay">완료일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input id="startDay" name="startDay" type="text" class="form-control" style="width: 150px;">&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;
			<input id="endDay" name="endDay" type="text" class="form-control" style="width: 150px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<select class="form-control" name="keyfield">
				<option value="subject">제목</option>
				<option value="writer">작성자</option>
			</select>
			<input type="text" class="form-control" id="searchKeyword" placeholder="keyword" name="keyword">
		</div>
		<button type="submit" class="btn btn-default">검색</button>
	</form>
</div>
<br>
<br>

<div style="height: 550px;">
	<table class="table table-striped" align="center">
		<thead>
			<tr>
				<c:if test="${requestScope.myDocs == 2}">
					<th width="100">즐겨찾기</th>
				</c:if>
				<th width="100">번호</th>
				<th>제목</th>
				<th width="200">작성일</th>
				<th width="200">완료일</th>
				<th width="100">작성자</th>
				<c:if test="${requestScope.myDocs == 1 or requestScope.myDocs == 2 and requestScope.status == 5}">
					<th width="100">
						<select name="status">
							<option>전체</option>
							<option>승인</option>
							<option>반려</option>
						</select>
					</th>
				</c:if>
				<c:if test="${requestScope.myDocs == 1}">
					<th width="100">비고</th>
				</c:if>
			</tr>
		</thead>
		<c:forEach var="document" items="${requestScope.documentList }" varStatus="loop">
	 		<c:url var="url" value="/detailDocument.do">
	 			<c:param name="id" value="${pageScope.document.id }" />
	 		</c:url>
	 		<tr>
	 			<%-- <td>${requestScope.paging.num - loop.index }</td> --%>
	 			<c:if test="${requestScope.myDocs == 2}">
					<td></td>
				</c:if>
	 			<td>${pageScope.document.id }</td> 			
	 			<td><a href="${pageScope.url }">${pageScope.document.subject }</a></td>
	 			<td>${pageScope.document.writeday }</td>
	 			<td>${pageScope.document.endDate }</td>
	 			<td>${pageScope.document.writer }</td>
	 			<c:if test="${requestScope.myDocs == 1 or requestScope.myDocs == 2 and requestScope.status == 5}">
		 			<td>${pageScope.document.status }</td>
		 		</c:if>
		 		<c:if test="${requestScope.myDocs == 1}">
		 			<td>&nbsp;&nbsp;<input type="checkbox" name="documentId" value="${pageScope.document.id }"></td>
		 		</c:if>
	 		</tr>
	 	</c:forEach>
	</table>
</div>

<c:if test="${requestScope.myDocs == 1}">
	<div align="right">
		<button type="button">삭제</button>
	</div>
</c:if>


<div class="col-md-12" align="center">
	<ul id="pagination" class="pagination">
		<li><a href="#" aria-label="Previous"> <span
				aria-hidden="true">&laquo;</span>
		</a></li>
		<li><a href="#">1</a></li>
		<li><a href="#">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
		</a></li>
	</ul>
</div>

<%-- 
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8"> 
  <title></title>
 </head>
 <body>
 	<table border="1">
 		<tr>
 			<th>번호</th>
 			<th>제목</th>
 			<th>임시저장일</th>
 			<th>비고</th>
 		</tr> 
 				
	 	 임시문서 목록 조회 	
	 	<c:forEach var="tempDocument" items="${requestScope.tempDocumentList }" varStatus="loop">
	 		<c:url var="url" value="/detailTempDocument.do">
	 			<c:param name="id" value="${pageScope.tempDocument.id }" />
	 		</c:url>
	 		<tr>
	 			<td>${requestScope.paging.num - loop.index }</td>	 			
	 			<td><a href="${pageScope.url }">${pageScope.tempDocument.subject }</a></td>
	 			<td>${pageScope.tempDocument.writeday }</td>
	 			<td></td>
	 		</tr>
	 	</c:forEach>
	 	</table>
	 	<br><br><br><br><br> 	 	
	 	
	 	 게시글 검색 
	 	<form action="${pageContext.request.contextPath }/listArticle.do" method="get">
	 		검색조건 
	 		<select name="keyfield1">
	 			<option value="subject">제목</option>
	 			<option value="writer">이름</option>
	 			<option value="content">내용</option>
	 		</select> 
	 		<input type="text" name="keyword1" size="20">
	 		<select name="keyfield2">
	 			<option value="subject">제목</option>
	 			<option value="writer">이름</option>
	 			<option value="content">내용</option>
	 		</select>
	 		<input type="text" name="keyword2" size="20">
	 		<button type="submit">검색</button>
	 	</form>
	 	<br><br><br><br><br>	 	
	 	 
	 	 페이징 처리
	 	<c:if test="${requestScope.paging.prevPage > 0 }">
	 		<c:url var="prevUrl" value="/listArticle.do">
	 			<c:param name="currentPage" value="${requestScope.paging.prevPage}" />
	 			<c:param name="keyfield" value="${param.keyfield}" />	
	 			<c:param name="keyword" value="${param.keyword}" />		 		
	 		</c:url>
	 		<a href="${prevUrl}"> [이전] </a> 
	 	</c:if>
	 	<c:forEach var="pageNum" begin="${requestScope.paging.startPage}" 
	 		end="${requestScope.paging.endPage}"> 
	 		<c:if test="${pageScope.pageNum != requestScope.paging.currentPage }">	 			
	 			<c:url var="url" value="/listArticle.do">
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
	 	<c:if test="${requestScope.paging.nextPage <= requestScope.paging.totalPage }">	 		
	 		<c:url var="nextUrl" value="/listArticle.do">
	 			<c:param name="currentPage" value="${requestScope.paging.nextPage}" />	
	 			<c:param name="keyfield" value="${param.keyfield}" />	
	 			<c:param name="keyword" value="${param.keyword}" />		 		
	 		</c:url>
	 		<a href="${nextUrl}"> [다음] </a> 	 		
	 	</c:if>
	 	--%>
	 	  
 </body>
</html>