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
	
	function replyList(data) {
		$('#replyList').empty();
		
		var htmlStr = "";
		for(var i=0; i<data.replyList.length; i++){
			htmlStr += "<div>";
			htmlStr += "<div id='replycontent' class='col-md-10'><textarea rows='2' cols='150' readonly>"+ data.replyList[i].content +"</textarea></div><br>";
			htmlStr += "<label>"+data.replyList[i].employee.name+"</label><label>"+data.replyList[i].writeday+"</label><br>";
			htmlStr += "<div class='col-md-1'><button id=" + data.replyList[i].id + ">수정</button></div>";
			htmlStr += "<div class='col-md-1'><button id=" + data.replyList[i].id + ">삭제</button></div>";
			htmlStr += "</div>"
			
		}	
		$('#replyList').append(htmlStr);
		$('#replytext').val("");
		
	}

	
	$(document).ready(function() {
		//댓글 등록	
		$('#addBtn').click(function(){
			$.ajax({
				url: '${pageContext.request.contextPath}/writeReply.do'
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
						url: '${pageContext.request.contextPath}/removeReply.do'
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
						url: '${pageContext.request.contextPath}/modifyReply.do'
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
  <div class="col-md-1"><button id="listBtn" onclick="location.href='${pageContext.request.contextPath}/listQnA.do?boardId=${requestScope.article.boardId}'">목록보기</button></div>
</div>

<!--  글제목 -->
<div class="row">
  <div class="col-md-12">${requestScope.article.subject}</div>
</div>
<br><br>

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
  <div class="col-md-1"></div>
  <div class="col-md-1"><strong>작성일</strong></div>
  <div class="col-md-1">${requestScope.article.writeday}</div>
</div>
<br><br>

<!-- 글내용 -->
<div class="row">
  <div class="col-md-12">${requestScope.article.content}</div>
</div>
<br><br>

<!-- 수정//삭제 버튼 -->
<div class="row">
	<div class="col-md-10"></div>
	<div class="col-md-1"><button id="modifyBtn" onclick="location.href='${pageContext.request.contextPath}/modifyQnA.do?id=${param.id}'">수정</button></div>
	<div class="col-md-1"><button id="deleteBtn" onclick="location.href='${pageContext.request.contextPath}/removeQnA.do?id=${param.id}&boardId=${requestScope.article.boardId}'">삭제</button></div>
</div>


<!-- 첨부파일 목록 -->
<div class="row">
		<c:forEach var="files" items="${requestScope.article.files}">
 			<div class="col-md-1"><a href="${pageScope.files.id}">${pageScope.files.originalFileName}</a></div>
 		</c:forEach> 
</div>
<br><br>
<!-- 댓글 등록 -->
<div class="row">
  <div class="col-md-11"><textarea id="replytext" rows="2" cols="150"></textarea></div><br>
  <div class="col-md-1"><button id="addBtn">댓글 등록</button></div><br>
</div>
<br><br>

<!-- 댓글 목록 -->

<div class="row" id="replyList">
	<c:forEach var="replys" items="${requestScope.article.replys}">
 		<div>
 			<div class="col-md-10"><textarea rows="2" cols="150" readonly>${pageScope.replys.content }</textarea></div><br>
 			<label>${pageScope.replys.employee.name}</label><label>${pageScope.replys.writeday}</label>
			<div class="col-md-1"><button id="${pageScope.replys.id}">수정</button></div>
  			<div class="col-md-1"><button id="${pageScope.replys.id}">삭제</button></div>
  		</div>
 	</c:forEach>
</div>