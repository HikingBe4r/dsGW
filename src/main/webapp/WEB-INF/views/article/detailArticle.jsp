<%-- detailArticle.jsp --%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.project.groupware.domain.ArticleVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


   
<!doctype html>
<!-- test -->
<html lang="en">
<head>
  <meta charset="UTF-8"> 
<script src="//code.jquery.com/jquery.min.js"></script>
<script
   src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>  	

  <script>
  
//목록 버튼
  $(document).ready(function() {   
  	$("#list").click(function() {
  		location.href	= 'listArticleForm.do?boardId=${requestScope.article.boardId}&open=${param.open}';
  	});
  });
  
  
	//전체 댓글 목록조회
   function listReply(data) {
		$('#replyList').empty();
		
		var htmlStr = "";
		for(var i=0; i<data.listReply.length; i++) {
			htmlStr += "<div>"
			htmlStr += "<label>"+data.listReply[i].employee.name+"</label><label>"+data.listReply[i].writeday+"</label><br>"; 
			htmlStr += "<div class='col-md-10'><textarea  rows='2' cols='150' readonly>"+ data.listReply[i].content +"</textarea></div>"; 
			htmlStr += "<div class='col-md-1'><button id=" +data.listReply[i].id+">수정</button></div>";
	      	htmlStr += "<div class='col-md-1'><button id=" +data.listReply[i].id+">삭제</button></div>";
	      	htmlStr += "</div>"	
		}	
		$('#replyList').append(htmlStr);
		$('#content').val("");

  } 
	
	
	
  $(document).ready(function() {
	  //댓글 등록	  
	  $('#addBtn').on('click', function() {
		  $.ajax({
			  url: '${pageContext.request.contextPath}/writeReply.do'
			  ,
			  method: 'GET'
			  ,
			  cache: false
			  ,
			  dataType: 'json'
			  ,
			  data: {
				  /* employeeId: $('#employeeId').val(), */
				  content: $('#content').val(),
				  articleId: '${param.id}'
			  },
			  success: function(data) {
				  listReply(data);
			  }
			  ,
			  error:function(jqXHR) {
				  alert("Error: " + jqXHR.responseText);
			  }
		  });
	  });
	  
	  
	  //댓글 삭제
	  $("#replyList").on('click', ':button', function() {	  
		  
		
		//삭제			  
		if($(this).text() == '삭제') {  
				$.ajax({
				  url: '${pageContext.request.contextPath}/removeReply.do'
				  ,
				  method: 'GET'
				  ,
				  cache: false
				  ,
				  dataType: 'json'
				  ,
				  data: {
					id: $(this).attr('id') ,
				  	articleId:  '${param.id}'
				  },
				  success: function(data) {
					  listReply(data);
				  }
				  ,
				  error:function(jqXHR) {
					$('#replyList').empty();
					$('#replyList').text(jqXHR.responseText);
				  }
			  });
			

		//댓글 수정
      }
		else if($(this).text() == '수정'){            
         $(this).parent().parent('div').find('textarea').removeAttr('readonly');               
         $(this).text('수정완료');
      
      }
		else if($(this).text() == '수정완료'){   //댓글 수정완료      
    	  
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
            	listReply(data);
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
  	</head>
 <body>
<input type="hidden" name="boardId" value="${param.boardId}">
 <input type="hidden" name="open" value="${param.open}">
<div class="panel panel-default">
   <div class="panel-body">일반 게 시 판</div>
</div>
<div class="row">
  <div class="col-md-11"></div>
  <div class="col-md-1"><button id="list">목록보기</button></div>
</div>
<div class="row">
  <div class="col-md-12">${requestScope.article.subject}</div>
</div>
<br><br>
<div class="row">
  <div class="col-md-1">글쓴이</div>
  <div class="col-md-1">${requestScope.article.employee.name}</div>
  <div class="col-md-1">조회수</div>
  <div class="col-md-1">${requestScope.article.hitcount}</div>
  <div class="col-md-1">댓글</div>
  <div class="col-md-1">${requestScope.article.rcount}</div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <div class="col-md-1">작성일</div>
  <div class="col-md-1">${requestScope.article.writeday}</div>
</div>
<br><br>
<div class="row">
  <div class="col-md-12">${requestScope.article.content}</div>
</div>
<br><br>

<div class="row">
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>
  <div class="col-md-1"></div>



<!-- 사원으로 수정,삭제 지우기 -->
<c:if test="${sessionScope.employee.id eq requestScope.article.employeeId}">
	  <c:url var = "modifyUrl" value="/modifyArticle.do">
	  	<c:param name="id" value="${requestScope.article.id}"></c:param>
	  </c:url>
	  <div class="col-md-1">	
	  	<a href="${pageScope.modifyUrl}"><button>수정</button></a>
	  </div>


	<c:url var="removeUrl" value="/removeArticle.do">
		<c:param name="id" value="${requestScope.article.id}"></c:param>
		<c:param name="boardId" value="${requestScope.article.boardId}"></c:param>
		<c:param name="oepn" value="${requestScope.board.oepn}"></c:param>
	</c:url>	  
		  <div class="col-md-1">	
		  <a href="${pageScope.removeUrl}"><button>삭제</button></a>
	</div>
</c:if>	
	
</div>
<br><br>

<!-- 파일 보여주기 -->
<div class="row">
      <c:forEach var="files" items="${requestScope.article.files}">
        	<c:url var="url" value="/downloadFile.do">
				<div class="col-md-1">
					<c:param name="originalFileName"
						value="${pageScope.files.originalFileName }" />
					<c:param name="systemFileName"
						value="${pageScope.files.systemFileName }" />
				</div>
			</c:url>
        	<tr>
				<td>파일${pageScope.loop.count }</td>
				<td><a href="${pageScope.url }">${pageScope.files.originalFileName }</a></td>
			</tr>
         
       </c:forEach> 
</div>

<!-- 댓글 등록 -->
<div class="row">
  <div class="col-md-11"><textarea rows="2" cols="180" id="content"></textarea></div>
  <div class="col-md-1" id="addBtn"><button>댓글 등록</button></div>
</div>
<br><br>

<!-- 댓글 목록 조회  -->
<div class="row" id="replyList" >
	<input type="hidden" name="articleId" value="${param.id}"/> 

   <c:forEach var="replys" items="${requestScope.article.replys}">
  	<div>
       	<label>${pageScope.replys.employee.name}</label><label>${pageScope.replys.writeday}</label><br>   
      	<div class="col-md-10"><textarea rows="2" cols="150" readonly>${pageScope.replys.content }</textarea></div>
	    <div class="col-md-1"><button id="${pageScope.replys.id}">수정</button></div>	
	    <div class="col-md-1"><button id="${pageScope.replys.id}">삭제</button></div>	
	</div>
   </c:forEach>
    
</div>
</body>
</html>



