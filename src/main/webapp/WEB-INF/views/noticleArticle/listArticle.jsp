<!-- 
 listArticle.jsp  -->
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.project.groupware.domain.ArticleVO"%>
<%@ page import="com.project.groupware.domain.EmployeeVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script>
	
		

	
	$(document).ready(function() {
				
		var currentPage = 1;
		var keytype = '전체';
		var keyword = '';
		
		//글쓰기 
		$('#writeBtn').click(function() {
			location.href = 'writeNoticeArticle.do?boardId=${param.boardId}&secret=${param.secret}';			
		});
		  
		
		function loadArticleList(data) {
			$("#articleBody").empty(data);
			$("#departments").empty(data);
			var htmlStr = "";
			if(data.articleList.length == 0) {
				alert("검색결과가 없습니다.");
			}
			
			var optionStr = "";
			
			optionStr += "<option value='all'>전체</option>"; 
			if(data.departments != null) {
				for(var j = 0; j < data.departments.length; j++) {
					if(data.departmentId == data.departments[j].id ) {
						optionStr += "<option value="+data.departments[j].id+" selected='selected'>"+data.departments[j].name+"</option>";	
					} else {
						optionStr += "<option value="+data.departments[j].id+">"+data.departments[j].name+"</option>";
					}
				}
			}
			
			
			$("#departments").append(optionStr);
			
			for(var i = data.paging.startArticleNum; i < data.paging.endArticleNum; i++) {
				
				var linkUrl = '${pageContext.request.contextPath}/detailNoticeArticle.do';	
					linkUrl += '?id=' + data.articleList[i].id;
					linkUrl += '&boardId=' + data.articleList[i].boardId;
					/* linkUrl += '&secret=' + '${param.secret}'; */
					
				
				htmlStr += "<tr>";
				htmlStr += "<td><label><input type='checkbox' name='checkRow' value="+data.articleList[i].id+"></label></td>";
				htmlStr += "<input type='hidden' id='id' value="+data.articleList[i].id +  "/>";
				htmlStr += "<td>"+data.articleList[i].id+"</td>";
				htmlStr += "<td><a href="+linkUrl+">"+data.articleList[i].subject+"</a></td>";
				if(data.articleList[i].employee.name == null) {
					htmlStr += "<td>관리자</td>";	
				} else {
					htmlStr += "<td>"+data.articleList[i].employee.name+"</td>";
				}
				
				htmlStr += "<td>"+data.articleList[i].writeday+"</td>";
				htmlStr += "<td>"+data.articleList[i].hitcount+"</td>";
				
				htmlStr += "<td>";
				if(data.articleList[i].count != 0) {
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
			url: '${pageContext.request.contextPath}/listNoticeArticle.do'
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
				boardId : '${param.boardId}',
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
				url : '${pageContext.request.contextPath}/listNoticeArticle.do'
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
				url : '${pageContext.request.contextPath}/listNoticeArticle.do'
				,
				method : 'GET'
				,
				cache : false
				,
				dataType : 'json'
				,
				data : {				
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
		
		
		//부서이동

		$('#departments').on("change", function() {
				alert('부서번호 : ' + $(this).find('option:selected').val());
			
				$.ajax({
					url : '${pageContext.request.contextPath}/departmentArticle.do'
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
						currentPage: '1',
						departmentId: $(this).find('option:selected').val()
						
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
		
		
		   //선택
	      $('#removeBtn').click(function() {
	         var array = [];
	         
	         $("input[name='checkRow']:checked").each(function() {
	            array.push($(this).val());   
	         });   
	         console.log(array);
	         
	         $("input[name='articleIdList']").val(array.join());      
	         $('#inputForm').submit();
	         
	         
	      });
	      
	      
	      //전체 선택
	      $('#allCheck').on('click', function() {
	         if ($(this).prop("checked") == true) {
	            $('input[type=checkbox]').prop('checked', true);
	            
	            var array = [];
	                  
	            $("input[name='checkRow']:checked").each(function() {
	               array.push($(this).val());   
	            });   
	            
	            $("input[name='articleIdList']").val(array.join());      
	            
	         } else {
	            $('input[type=checkbox]').prop('checked', false);
	         }
	      });     
	   

	/*  //전체 선택
    $('#allCheck').click(function() {
    	 $(":checkbox[name='allCheck']").each(function() {
			 var subChecked = $(this).attr('checked');
			 
			 if (subChecked != 'checked')
			 	$(this).click();
			 
		 });
	});
   */
   
	     /*  //전체 해제
	     $('#allCheck').click(function() {
	      	 $(":checkbox[name='allCheck']").each(function() {
	  			 var subChecked = $(this).attr('checked');
	  			 
	  			 if (subChecked != 'checked')
	  			 	$(this).click();
	  			 
	  		 });
	  	});
	     */
	     
	      /*  //선택 삭제
	      $('#removeBtn').click(function() {
	    	  
	    	  var checkRow = '';
				
				$(":checkbox[name='documentId']:checked").each(function(){
					checkRow = checkRow + $(this).val() + ', ';
				});
				
				checkRow = checkRow.substring(0, checkRow.lastIndexOf(', ')); //맨끝 콤마 지우기
				
				if(checkRow == '') {
					alert("삭제할 문서를 선택하세요.");
				    return;
				}
	    	  
							
					$.ajax({
						url: '${pageContext.request.contextPath}/removeArticleList.do'
						,
						method: 'GET'
						,
						dataType: 'json'
						,
						data: {
							
							keytype: $("#keytype").val(),
							keyword: $("#searchKeyword").val(),
							boardId : '${param.boardId}',
							secret: '${param.secret}',
							currentPage : '1'
						}
						,
						cache: false
						,
						success: function(data) {
							loadArticleList(data);
							pagination(data);
						}
						,
						error : function(jqXHR) {
							alert("Error : " + jqXHR.responseText);
							console.log(jqXHR.responseText);
						}
						
					});
			
				
			}); */
	   
	     
	     
});

</script>


<html lang="en">
<a></a>
<div class="panel panel-default">
   <div class="panel-body">일반 게시판</div>
</div>
<div>

   
      <form action="${pageContext.request.contextPath}/listNoticeArticle.do"   method="get" class="form-inline pull-right">
      <input type="hidden" name="boardId" value="${param.boardId}">
      <input type="hidden" name="secret" value="${param.secret}">

 
     <c:if test="${sessionScope.employee.id eq null}">
      <c:if test="${param.secret eq 0}">
     	<select name="departments" id="departments" class="form-control">
     			<option value="all">전체</option>
     			
			<c:forEach var="department" items="${requestScope.departments }" varStatus="loop">
				<option value="${department.id}">${department.name}</option>
			</c:forEach>
		</select>
	 </c:if>
	</c:if>
			<select name="keytype" id="keytype" class="form-control">
				<option value="subject">제목</option>
				<option value="name">작성자</option>
				<option value="content">내용</option>
			</select>

     <div class="form-group">
			<input type="text" class="form-control" id="searchKeyword"	placeholder="keyword">
		</div>
   	  <button type="button" class="btn btn-default" id="searchBtn">검색</button>
   </form>
</div>
<br>
<br>

<div style="height: 550px;">
   <div class="checkbox">
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
       <%--   <c:forEach var="article" items="${requestScope.articles}"
            varStatus="loop">
            <c:url var="url" value="/detailArticle.do">            
               <c:param name="id" value="${pageScope.article.id }" />
			   <c:param name="boardId" value="${param.boardId }" />
			   <c:param name="open" value="${param.open }" />
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
         </c:forEach>  --%>
		</tbody>
      </table>
   </div>
</div>




    <div class="pull-right">
      <form action="${pageContext.request.contextPath}/removeNoticeArticleList.do" id="inputForm" method="get">
         <input type="hidden"  name="articleIdList"  value="">
         <input type="hidden" name="boardId" value="${param.boardId}">
         <button type="button" class="btn btn-primary" id="writeBtn">등록</button>
         <button type="button" id="removeBtn" class="btn btn-default">삭제</button>
      </form>
   </div>

<div class="col-md-12" align="center">
	<ul id="pagination" class="pagination">	
		</ul>
	</div>












