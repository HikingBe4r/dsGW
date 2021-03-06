<%-- listBoard.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.project.groupware.domain.BoardVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script>
//전체 게시판 목록 조회
 function listBoard(data) {
	 $('#List').empty();
	 
	 var htmlStr = "";
	 for(var i=0; i<data.boardList.length; i++) {
		 htmlStr += "<tr>";
		 htmlStr +=	"<td>" + data.boardList[i].name + "</td>";
		 htmlStr +=	"<td>" + data.boardList[i].note + "</td>"
		/*  htmlStr +=	"<td><button type='button' class='btn btn-default'" +data.replyList[i].id+">수정</button></td>"
		 htmlStr +=	"<td><button type='button' class='btn btn-default'" +data.replyList[i].id+">삭제</button></td>"	 */
		 htmlStr += "</tr>";
	 }
	 $('#List').append(htmlStr);
	 $('#name').val("");
 }
 
 $(document).ready(function() {
	 //게시판 등록
	 $('#addbtn').on('click',function() {
		 alert("call");
		$.ajax({
			 url: '${pageContext.request.contextPath}/writeBoard.do'
				  ,
				  method: 'GET'
				  ,
				  cache: false
				  ,
				  dataType: 'json'
				  ,
				  data: {
					  name: $('#name').val(),
					  note: $('#note').val()
					  
				  },
				  success: function(data) {
					  listReply(data);
				  }
				  ,
				  error:function(jqXHR) {
					  alert("Error: " + jqXHR.responseText);
				  }
		}) ;		 
	 }); 
 });

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

<table class="table table-hover">
	<thead>
	<tr>
		<th width="100">게시판이름</th>
		<th width="100">비고</th>
	<!-- 	<th width="100">수정</th>
		<th width="100">삭제</th> -->
		
	</tr>
	</thead>
	<tbody id="boardList">
	 <c:forEach var="board" items="${requestScope.boards}" varStatus="loop" >
		<tr>	
			<td>${pageScope.board.name}</td>
			<td>${pageScope.board.note}</td>
<%-- 			<td><button type="button" id="${pageScope.board.id}">수정</button></td>
	    	<td><button type="button" id="${pageScope.board.id}">삭제</button></td>	 --%>		
		</tr>
		<input type="hidden" name="departmentId" value="${pageScope.board.departmentId}"/> 
	</c:forEach>
	</tbody>
</table>
</div>

<!-- 게시판 등록 -->
<table class="table table-hover">
<tr>
<td>

<!-- <div class="row">
  <div class="col-md-1">게시판이름</div>
  <div class="col-md-5"><textarea rows="2" cols="80" id="note"></textarea></div>
</div> 
<div class="row">
  <div class="col-md-1">비고</div>
  <div class="col-md-5"><textarea rows="2" cols="80" id="note"></textarea></div>
  <div class="col-md-1" id="addBtn"><button>등록</button></div>
</div> -->
<br><br>
</td>
</tr>
</table>


