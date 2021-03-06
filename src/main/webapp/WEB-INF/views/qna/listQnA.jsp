<!-- listQnA.jsp --> 
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.project.groupware.domain.ArticleVO"%>
<%@ page import="com.project.groupware.domain.EmployeeVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

<script>


//쓰기 버튼
$(document).ready(function() {   
	$('#writeBtn').click(function() {
		location.href	= 'writeQnA.do?boardId=${param.boardId}';
	});
});

	$(document).ready(function() {
		var currentPage = 1;
		var keytype = "";
		var keyword = "";
		  
		
		function loadArticleList(data) {
			$("#articleBody").empty(data);
			var htmlStr = "";
			if(data.loadArticleList.length == 0) {
				alert("검색결과가 없습니다.");
			}
			for(var i = data.paging.startArticleNum; i < data.paging.endArticleNum; i++) {
				
				var linkUrl = '${pageContext.request.contextPath}/detailQnA.do';	
					linkUrl += '?id=' + data.loadArticleList[i].id;
					linkUrl += '&boardId=' + data.loadArticleList[i].boardId;
				
				htmlStr += "<tr>";
				htmlStr += "<td><label><input type='checkbox' name='checkRow' value="+data.loadArticleList[i].id + "></label></td>";
				htmlStr += "<input type='hidden' id='id' value="+data.loadArticleList[i].id +"/>";
				htmlStr += "<td>"+data.loadArticleList[i].id+"</td>";
				htmlStr += "<td><a href="+linkUrl+">"+data.loadArticleList[i].subject+"</a></td>";
				htmlStr += "<td>"+data.loadArticleList[i].employee.name+"</td>";
				htmlStr += "<td>"+data.loadArticleList[i].writeday+"</td>";
				htmlStr += "<td>"+data.loadArticleList[i].hitcount+"</td>";

				htmlStr += "<td>";
				if(data.loadArticleList[i].count != 0) {
					htmlStr += "<span class='glyphicon glyphicon-save' aria-hidden='true'></span>";
				}
				htmlStr += "</td>";
				
			}
			
			$("#articleBody").append(htmlStr);
		}
		
		function pagination(data) {
			$("#pagination").empty(data);
			
			var htmlStr = "";
			
			htmlStr += "<li name='pageNum' id='pageNum' value="+data.paging.prevPage+">";
			htmlStr += "<a aria-label='Previous'>";
			htmlStr += '&laquo;';
			htmlStr += "</a>";
			htmlStr += "</li>";
			for(var i = data.paging.startPage; i <= data.paging.endPage; i++) {
				if(data.paging.currentPage == i) {
					htmlStr += "<li class='active' name='pageNum' id='pageNum' value="+ i +">";
				} else {
					htmlStr += "<li name='pageNum' id='pageNum' value="+ i +">";
				}
				htmlStr += "<a>";
				htmlStr += i;
				htmlStr += "</a>";
				htmlStr += "</li>";
			}
			htmlStr += "<li name='pageNum' id='pageNum' value="+data.paging.nextPage+">";
			htmlStr += "<a aria-label='Next'>";
			htmlStr += '&raquo;';
			htmlStr += "</a>";		
			htmlStr += "</li>";
			
			
			$("#pagination").append(htmlStr);
			$("#searchKeyword").val('');
		}
		
		//페이지 로드시
		$.ajax ({
			url: '${pageContext.request.contextPath}/listQnA.do'
			,
			method : 'GET'
			,
			cache : false
			,
			dataType : 'json'
			,
			data : {
				keytype: $("#keytype").val(),
				keyword: $("#searchKeyword").val(),
				boardId: '${param.boardId}',
				secret: '${param.secret}',
				currentPage : '1'
			}
			,
			success: function(data) {
				loadArticleList(data);
				pagination(data);
			}
			,
			error : function(jqXHR) {
				alert("ERROR!");
				console.log(jqXHR.responseText);
			}
		});
		
		// 검색
		$("#searchBtn").click(function() {
			// 검색시 keyword를 따로 저장. -> 페이징 처리때 사용			
			keyword = $("#searchKeyword").val();
			
			$.ajax({
				url : '${pageContext.request.contextPath}/listQnA.do'
				,
				method : 'GET'
				,
				cache : false
				,
				dataType : 'json'
				,
				data : {
					//employeeId : '${sessionScope.employee.id}',
					keytype: $("#keytype").val(),
					keyword: $("#searchKeyword").val(),
					boardId: "${param.boardId}",
					secret: '${param.secret}',
					currentPage: '1'
				}
				,
				success : function(data) {
					loadArticleList(data);
					pagination(data);
				}	
				,
				error : function(jqXHR) {
					alert("ERROR: "+jqXHR.responseText);
					console.log(jqXHR.responseText);
				}
				
			});
			
			

		}); 
		
		
		// 페이지 클릭시
		$("#pagination").on("click", "li", function() {
			$.ajax({
				url : '${pageContext.request.contextPath}/listQnA.do'
				,
				method : 'GET'
				,
				cache : false
				,
				dataType : 'json'
				,
				data : {
					//employeeId : '${sessionScope.employee.id}',
					keytype: keytype,
					keyword: keyword,
					boardId: "${param.boardId}",
					secret: '${param.secret}',
					currentPage: $(this).val()
				}
				,
				success : function(data) {
					loadArticleList(data);
					pagination(data);
					currentPage = data.paging.currentPage;
				}	
				,
				error : function(jqXHR) {
					alert("ERROR: "+jqXHR.responseText);
					console.log(jqXHR.responseText);
				}
				
			
			});
		});
		
		//내글보기
		
	 	$('#myBtn').click(function() {
			
			if($(this).text() =='내글보기' ) {
				
				$.ajax({
					url : '${pageContext.request.contextPath}/myQnA.do'
					,
					method : 'GET'
					,
					cache : false
					,
					dataType : 'json'
					,
					data : {
						employeeId : '${sessionScope.employee.id}', 
						boardId: "${param.boardId}",
						secret: '${param.secret}',
						currentPage: '1'
						
					}
					,
					success : function(data) {
						loadArticleList(data);
						pagination(data);
						currentPage = data.paging.currentPage;
					}	
					,
					error : function(jqXHR) {
						alert("ERROR: "+jqXHR.responseText);
						console.log(jqXHR.responseText);
					}		
				});
				
				 $(this).text('전체조회');

			}
			
			else if($(this).text() =='전체조회' ) {
				
				$.ajax({
					url : '${pageContext.request.contextPath}/listQnA.do'
					,
					method : 'GET'
					,
					cache : false
					,
					dataType : 'json'
					,
					data : {
						
					
						boardId: "${param.boardId}",
						secret: '${param.secret}',
						currentPage: '1'
						
					}
					,
					success : function(data) {
						loadArticleList(data);
						pagination(data);
						currentPage = data.paging.currentPage;
					}	
					,
					error : function(jqXHR) {
						alert("ERROR: "+jqXHR.responseText);
						console.log(jqXHR.responseText);
					}		
				});
				
				$(this).text('내글보기');
			}
	 	});
		
		
			
			
		
				
		   //선택 삭제
	      $('#removeBtn').click(function() {
	         if(confirm("게시글을 삭제 하시겠습니까??")){
	    	  
	    	 	var array = [];
	         
	         	$("input[name='checkRow']:checked").each(function() {
	            	array.push($(this).val());   
	         	});	   
	         	$("input[name='checkList']").val(array.join());      
	         	$('#inputForm').submit();
	         	console.log($("input[name='checkList']:checked").val());
	         }
	         
	         
	      });
	      
	      
	      //전체 선택
	      $('#allCheck').on('click', function() {
	         if ($(this).prop("checked") == true) {
	            $('input[type=checkbox]').prop('checked', true);
	            
	            var array = [];
	                  
	            $("input[name='checkRow']:checked").each(function() {
	               array.push($(this).val());   
	            });   
	            $("input[name='checkList']").val(array.join());      
	            
	         } else {
	            $('input[type=checkbox]').prop('checked', false);
	         }
	         
	         console.log($("input[name='checkList']").val());
	      });     
	   

	     
});	 	


</script>
		
<div class="panel panel-default">
   <div class="panel-body">질문 게시판</div>
</div>

 
<div id="myArticleList">
	<c:if test="${sessionScope.employee.id ne null}">
		<button type="button" class="btn btn-default" id="myBtn" >내글보기</button>
	</c:if>
   <form action="${pageContext.request.contextPath}/listQnA.do"   method="get" class="form-inline pull-right">
      <input type="hidden" name="boardId" value="${param.boardId}">
       
      <c:if test="${sessionScope.employee.id eq null}">
     	<select name="departments" id="departments" class="form-control">
     			<option value="all">전체</option>
			<c:forEach var="department" items="${requestScope.departments }" varStatus="loop">
				<option value="${department.id}">${department.name}</option>
			</c:forEach>
		</select>
	 </c:if>
			<select name="keytype" id="keytype" class="form-control">
				<option value="subject">제목</option>
				<option value="name">작성자</option>
				<option value="content">내용</option>
			</select>

     <div class="form-group">
			<input type="text" class="form-control" id="searchKeyword" placeholder="keyword">
		</div>
   	  <button type="button" class="btn btn-default" id="searchBtn">검색</button>
   </form>
</div>
<br>
<br>

<div style="height: 550px;">
<form id="checkArticle" name="checkArticle" >

      <table class="table table-hover" align="center">
         <thead>
            <tr>
               <th width="50"><label><input id="allCheck"   name="allCheck" type="checkbox"></label></th>
               <th width="100">번호</th>
               <th>제목</th>
               <th width="200">이름</th>
               <th width="200">날짜</th>
               <th width="100">조회수</th>
               <th width="100">파일</th>
            </tr>
         </thead>
         
 		<tbody id="articleBody">

		</tbody>
	</table>
	</form>
</div>

<div class="pull-right">
      <form action="${pageContext.request.contextPath}/removeQnAList.do" id="inputForm" method="get">
         <input type="hidden"  name="checkList"  value="">
         <input type="hidden" name="boardId" value="${param.boardId}">
         <input type="hidden" name="secret" value="${param.secret}">
         <button type="button" id="writeBtn"  class="btn btn-default">글쓰기</button>
         <button type="button" id="removeBtn" class="btn btn-default">삭제</button>
      </form>
      
   </div>

<div class="col-md-12" align="center">
	<ul id="pagination" class="pagination">	
		</ul>
	</div>


     