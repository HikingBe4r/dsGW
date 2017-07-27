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
	 $('#boardList').find('tr:not(:eq(0))').remove();
 
	 var htmlStr = "";
	 for(var i=0; i<data.boardList.length; i++) {
		 htmlStr += "<tr>";
		 htmlStr +=	"<td><textarea rows='2' cols='20' readonly>" + data.boardList[i].name + "</textarea></td>";
		 htmlStr +=	"<td><textarea rows='2' cols='20' readonly>" + data.boardList[i].note + "</textarea></td>";
		 htmlStr +=	"<td><button type='button'  id=" + data.boardList[i].id + ">수정</button></td>";
		 htmlStr +=	"<td><button type='button'  id=" + data.boardList[i].id + ">삭제</button></td>";
		 htmlStr += "<td>" + data.boardList[i].articleCount + "</td>"
		 htmlStr += "</tr>";
	 }
	 $('#boardList').append(htmlStr);
	 $('#name').val("");
	 $('#note').val(""); 
 }
 
 $(document).ready(function() {
	 //게시판 등록
	 
	 var checked = 0;
	 $('#addBtn').on('click',function() {
		
	     if($(this).prop('checked')) {
	            checked = $('input[name=secret]').val("1");
	         } else {
	            checked = $('input[name=secret]').val("0");
	            
	         }
	
		 
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
					  note: $('#note').val(),
					  secret: checked
					  
				  },
				  success: function(data) {
					 	listBoard(data);
					
				  }
				  ,
				  error:function(jqXHR) {
					  alert("Error: " + jqXHR.responseText);
				  }
		});		 
	 }); 
	 
	//게시판 삭제
	  $("#boardList").on('click', ':button', function() {	  		
		//삭제			  
		if($(this).text() == '삭제') {  
				
				$.ajax({
				  url: '${pageContext.request.contextPath}/removeBoard.do'
				  ,
				  method: 'GET'
				  ,
				  cache: false
				  ,
				  dataType: 'json'
				  ,
				  data: {
					id: $(this).attr('id')

				  },
				  success: function(data) {				
				  	if(data.isRemoved == 1) {
				  		alert('등록된  게시글이 존재합니다.');
				  	}
				  	
				  	listBoard(data);
				
				  }
				  ,
				  error:function(jqXHR) {
					$('#boardList').empty();
					$('#boardList').text(jqXHR.responseText);
					 
				  }
			  });
	
		//게시판 수정
     }else if($(this).text() == '수정'){            
        $(this).parent().parent('tr').find('textarea').removeAttr('readonly');               
        $(this).text('수정완료');
     
     }else if($(this).text() == '수정완료'){   //댓글 수정완료      
        $.ajax({
           url: '${pageContext.request.contextPath}/modifyBoard.do'
           ,
           method: 'GET'
           ,
           cache: false
           ,
           data: {
              id: $(this).attr('id'),
              departmentId: '${param.departmentId}',
              name: $(this).parent().parent('tr').find('textarea').val(),
              note: $(this).parent().parent('tr').find('textarea').val()
           }
           ,
           dataType: 'json'
           ,
           success: function(data) {
        	   boardList(data);
           }
           ,
           error: function(jqXHR) {
              alert("Error : " + jqXHR);
           }
        });
        
        $(this).parent().parent('tr').find('textarea').attr('readonly');
        $(this).text('수정');
     
     }

		
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
<table class="table table-hover">
<tr>
<td>

<div class="row">
  <div class="col-md-1">전체보기</div>
  <div class="col-md-5"><input id="secret" value="0" type="checkbox"></div>
</div>

<div class="row">
  <div class="col-md-1">게시판이름</div>
  <div class="col-md-5"><textarea rows="2" cols="80" id="name"></textarea></div>
</div> 
<div class="row">
  <div class="col-md-1">비고</div>
  <div class="col-md-5"><textarea rows="2" cols="80" id="note"></textarea></div>
  <div class="col-md-1" id="addBtn"><button>등록</button></div>
</div>
<br><br>
</td>
</tr>
</table>


