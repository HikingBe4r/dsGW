<%-- listBoard.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.project.groupware.domain.BoardVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script>


</script>

<a></a>
<div class="panel panel-default">
	<div class="panel-body">게시판 관리</div>
</div>
<div>
	<form class="form-inline pull-right">

		
		<select class="form-control">
			<option>제목</option>
			<option>작성자</option>
			<option>내용</option>
		</select>
	
	
	
		
	</form>
</div>
<br><br>

<!--  게시판 목록조회 -->
<div style="height: 550px;">
			
			<c:url var="modifyUrl" value="/modifyBoard.do">
		 		<c:param name="id" value="${requestScope.board.id }" />
			</c:url>
			<c:url var="removeUrl" value="/removeBoard.do">
			 	<c:param name="id" value="${requestScope.board.id }" />
			</c:url> 	

	<input type="hidden" name="departmentId" value="${param.departmentId}"/> 
<table class="table table-hover"  id="boardList">

	<thead>
	<tr>
		
		<th width="100">게시판이름</th>
		<th width="100">비고</th>
		<th width="100">수정</th>
		<th width="100">삭제</th>
		<th width="100">게시글수</th>	
	</tr>
	</thead>
	
		
	 	

 <c:forEach var="board" items="${requestScope.boards}" varStatus="loop" >
		
		
		<tr>
			
			<td><textarea rows="2" cols="20" readonly>${pageScope.board.name}</textarea></td>
			<td><textarea rows="2" cols="20" readonly>${pageScope.board.note}</textarea></td>
			<td><button type="button" id="${pageScope.board.id}">수정</button></td>
	    	<td><button type="button" id="${pageScope.board.id}">삭제</button></td>
	    	<td>${pageScope.board.articleCount}</td>
		</tr>
	
</c:forEach>
</table>
</div>


<!-- 게시판 등록 -->
<form action="${pageContext.request.contextPath }/writeBoard.do"  method="get" enctype="multipart/form-data">
<input type="hidden" name="departmentId" value="${param.departmentId}">
<table class="table table-hover">
<tr>
<td>


<div class="row">
  <div class="col-md-1">게시판이름</div>
  <div class="col-md-5"><textarea rows="2" cols="80" name="name"></textarea></div>
</div>
</td> 
</tr>
<tr>
<td>
<div class="row">
  <div class="col-md-1">비고</div>
  <div class="col-md-5"><textarea rows="2" cols="80" name="note"></textarea></div>
  <div class="col-md-1"><button type="submit">등록</button></div>
  
</div>
<br><br>
</td>

</table>
</form>

