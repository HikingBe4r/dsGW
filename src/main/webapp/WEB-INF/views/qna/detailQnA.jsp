<%-- detailQnA.jsp --%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.project.groupware.domain.ArticleVO"%>
<%@ page import="com.project.groupware.domain.ArticleFileVO" %>
<%@ page import="com.project.groupware.domain.BoardVO" %>
<%@ page import="com.project.groupware.domain.ArticleReplyVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- test -->
<%@ page contentType="text/html; charset=utf-8" %>

<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

<script>
	
$(document).ready(function() {   
  	$("#listBtn").click(function() {
  		location.href	= 'listQnAForm.do?boardId=${requestScope.article.boardId}';
  	});
  	
  	$("#deleteBtn").click(function(){
  		if(confirm("게시글을 삭제 하시겠습니까??")){
  			location.href='removeQnA.do?id=${requestScope.article.id}&boardId=${param.boardId}';
  		}
  	});
  	
  	$("#modifyBtn").click(function(){
  		location.href='modifyQnAForm.do?id=${requestScope.article.id}&boardId=${param.boardId}';
  	});
  	
  });
	
	function replyList(data) {
		$('#replyList').empty();
		
		var htmlStr = "";
		for(var i=0; i<data.replyList.length; i++){
			htmlStr += "<div class='row'>";
			htmlStr += "<div class='col-md-1'><label>"+data.replyList[i].employee.name+"</label>&nbsp;</div>";
			htmlStr += "<div class='col-md-2'><label>"+data.replyList[i].writeday+"</label></div>";
			htmlStr += "</div>";
			htmlStr += "<div class='row'>";
			htmlStr += "<div class='col-md-9'><textarea class='form-control' rows='2' readonly>"+ data.replyList[i].content +"</textarea></div>";
			htmlStr += "<div class='col-md-3'>";
			htmlStr += "<button class='btn btn-default' id=" + data.replyList[i].id + ">수정</button>";
			htmlStr += "<button class='btn btn-default' id=" + data.replyList[i].id + ">삭제</button>";
			htmlStr += "</div>";
			htmlStr += "</div>";			
			
		}	
		$('#replyList').append(htmlStr);
		$('#replytext').val("");
		
	}

		
	$(document).ready(function() {
		//댓글 등록	
		$('#addBtn').click(function(){
			$.ajax({
				url: '${pageContext.request.contextPath}/writeQnAReply.do'
				,
				method: 'GET'
				,
				cache: false
				,
				dataType: 'json'
				,
				data:{
					content: $('#replytext').val(),
					articleId: '${param.id}'
				}
				,
				success: function(data) {
					replyList(data);
				}
				,
				error: function(jqXHR){
					alert("Error: " + jqXHR.responseText);
				}
			}); 
		});
	
		
		$('#replyList').on('click', ':button', function() {
			//댓글 삭제
			if($(this).text() == '삭제'){
				$.ajax({
						url: '${pageContext.request.contextPath}/removeQnAReply.do'
						,
						method: 'GET'
						,
						cache: false
						,
						data: {
							articleId: '${param.id}',
							replyId: $(this).attr('id')
						}
						,
						dataType: 'json'
						,
						success: function(data) {
							replyList(data);
						}
						,
						error: function(jqXHR) {
							alert("Error : " + jqXHR);
						}
						
					});
				
				//댓글 수정
				}else if($(this).text() == '수정'){				
					$(this).parent().parent('div').find('textarea').removeAttr('readonly');					
					$(this).text('수정완료');
				
				}else if($(this).text() == '수정완료'){   //댓글 수정완료		
					$.ajax({
						url: '${pageContext.request.contextPath}/modifyQnAReply.do'
						,
						method: 'GET'
						,
						cache: false
						,
						data: {
							replyId: $(this).attr('id'),
							articleId: '${param.id}',
							content: $(this).parent().parent('div').find('textarea').val()
						}
						,
						dataType: 'json'
						,
						success: function(data) {
							replyList(data);
						}
						,
						error: function(jqXHR) {
							alert("Error : " + jqXHR);
						}
					});
					
					$(this).parent().parent('div').find('textarea').attr('readonly');
					$(this).text('수정');
				
				}

				
			});
		});
	
	
</script>
	
	
<div class="panel panel-default">
	<div class="panel-body">Q n A 게 시 판</div>
</div>
<div class="row">
  <div class="col-md-11"></div>
  <div class="col-md-1"><button class="btn btn-default" id="listBtn">목록보기</button></div>
</div>

<!--  글제목 -->
<div class="row">
  <div class="col-md-12"><strong><h2>${requestScope.article.subject}</h2></strong></div>
</div><br>

<!-- 상세 정보 -->
<div class="row">
  <div class="col-md-1"><strong>글쓴이</strong></div>
  <div class="col-md-1">${requestScope.article.employee.name}</div>
  <div class="col-md-1"><strong>조회수</strong></div>
  <div class="col-md-1">${requestScope.article.hitcount}</div>
  <div class="col-md-1"><strong>댓글수</strong></div>
  <div class="col-md-1">${requestScope.article.rcount}</div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <div class="col-md-1"><strong>작성일</strong></div>
  <div class="col-md-2">${requestScope.article.writeday}</div>
</div>
<br><br>

<!-- 글내용 -->
<div class="row">
  <div class="col-md-12">${requestScope.article.content}</div>
</div>
<br><br>

<!-- 수정//삭제 버튼 -->
<div id="mrBtn" class="row">
	<div class="col-md-10"></div>
	<div class="col-md-1"><button class="btn btn-default" id="modifyBtn" >수정</button></div>
	<div class="col-md-1"><button class="btn btn-default" id="deleteBtn" >삭제</button></div>
</div>


<!-- 첨부파일 목록 -->
<div class="row">
 		<c:forEach var="files" items="${requestScope.article.files}">
			<c:url var="downloadURL" value="/downloadFile.do">
 				<c:param name="originalFileName" value="${pageScope.files.originalFileName }"/>
 				<c:param name="systemFileName" value="${pageScope.files.systemFileName }"/>
 				<c:param name="kind" value="article"/>
 			</c:url> 
 			<div class="col-md-1"><a href="${pageScope.downloadURL }">${pageScope.files.originalFileName}</a></div>
 		</c:forEach> 
</div>
<br><br>
<!-- 댓글 등록 -->
<div class="row">
  <div class="col-md-10"><textarea class="form-control" id="replytext" rows="2"></textarea></div><br>
  <div class="col-md-2"><button class="btn btn-default" id="addBtn">댓글 등록</button></div><br>
</div>
<br><br>

<!-- 댓글 목록 -->

<div id="replyList">
	<c:forEach var="replys" items="${requestScope.article.replys}">
 		<div class="row">
 			<div class="col-md-1"><label>${pageScope.replys.employee.name}</label>&nbsp;</div>
 			<div class="col-md-2"><label>${pageScope.replys.writeday}</label></div>
 		</div>
 		<div class="row">
 			<div class="col-md-9"><textarea class="form-control" rows="2" readonly>${pageScope.replys.content }</textarea></div>
			<div class="col-md-3">
				<button class="btn btn-default" id="${pageScope.replys.id}">수정</button>
				<button class="btn btn-default" id="${pageScope.replys.id}">삭제</button>	
			</div>
  		</div>
 	</c:forEach>
</div>
