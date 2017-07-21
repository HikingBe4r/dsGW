<%-- listApprovalDocument.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js?ver=2"></script>


<script>

	function listApprovalDocument(data) {
		$("#documents").empty(data);
		var htmlStr = "";
		if(data.documentList.length == 0) {
			alert("검색결과가 없습니다.");
		}
		
		for(var i = data.paging.startArticleNum; i < data.paging.endArticleNum; i++) {
						
			var linkUrl = '${pageContext.request.contextPath}/detailApprovalDocument.do';
				linkUrl += '?documentId=' + data.documentList[i].ID;
			htmlStr += '<tr align="center">';
			htmlStr += '<td width="100">'+data.documentList[i].ID+'</td>';
			htmlStr += '<td><a href='+linkUrl+'>'+data.documentList[i].SUBJECT+'</a></td>';
			htmlStr += '<td width="100">'+data.documentList[i].NAME +'</td>';
			htmlStr += '<td width="100">'+data.documentList[i].WRITEDAY +'</td>';
			htmlStr += '<td width="100">'+data.documentList[i].ENDDATE +'</td>';
			htmlStr += '<td width="100">'+data.documentList[i].STATUS +'</td>';
			htmlStr += '</tr>';
		}		
		$("#documents").append(htmlStr);
		$("#searchKeyword").val('');
	};
	
	function pagination(data) {
		$("#pagination").empty(data);
		
		var htmlStr = "";		
		
		var prevPage = 
		
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
		
		/*
		// 이게 왜 실패했는지 생각해보자.
		if(data.paging.currentPage == $("#pageNum").val()) {
			$("#pageNum").attr("class", "active");
		}
		*/
		
		$("#pagination").append(htmlStr);
	}
		


	$(document).ready(function() {
		// 오픈되자마자.
		$.ajax({
				url : '${pageContext.request.contextPath}/selectListApprovalDocument.do'
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
					currentPage: "1"
				}
				,
				success : function(data) {
					listApprovalDocument(data);
					pagination(data);
				}
				,
				error : function(request,status,error) {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
		});
		
		$("#searchBtn").click(function() {
			$.ajax({
				url : '${pageContext.request.contextPath}/selectListApprovalDocument.do'
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
					currentPage: '1'
				}
				,
				success : function(data) {
					listApprovalDocument(data);
					pagination(data);
				}	
				,
				error : function(jqXHR) {
					alert("ERROR: "+jqXHR.responseText);
					console.log(jqXHR.responseText);
				}
				
			});
		});
		
		$("#pagination").on("click", "li", function() {
			$.ajax({
				url : '${pageContext.request.contextPath}/selectListApprovalDocument.do'
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
					currentPage: $(this).val()
				}
				,
				success : function(data) {
					listApprovalDocument(data);
					pagination(data);
				}	
				,
				error : function(jqXHR) {
					alert("ERROR: "+jqXHR.responseText);
					console.log(jqXHR.responseText);
				}
				
			});
		});
		
	});
	
</script>

<div class="panel panel-default">
	<div class="panel-body">결재대기문서 목록</div>
</div>
<div>
	<form class="form-inline pull-right" name="searchForm">

		<select class="form-control" name="keytype" id="keytype">
			<option value="전체" id="1">전체</option>
			<option value="제목" id="2">제목</option>
			<option value="작성자" id="3">작성자</option>
		</select>

		<div class="form-group">
			<input type="text" class="form-control" id="searchKeyword"
				placeholder="keyword">
		</div>
		<button type="button" class="btn btn-default" id="searchBtn">검색</button>
	</form>
</div>

<br>
<br>

<div style="height: 550px;">
	<table class="table table-striped" >
		<thead>
			<tr align="center">
				<th width="100">번호</th>
				<th>제목</th>
				<th width="100">기안자</th>
				<th width="100">작성일</th>
				<th width="100">시행일</th>
				<th width="100">상태</th>
			</tr>
		</thead>
		<tbody id="documents">
			<c:forEach var="document" items="${requestScope.documentList }"
				varStatus="loop">
				<c:url value="/detailApprovalDocument.do" var="url">
					<c:param name="documentId" value="${document.ID }"></c:param>
				</c:url>
				
				<tr align="center">
					<td width="100">${document.ID}</td>
					<td><a href="${url }">${document.SUBJECT }</a></td>
					<td width="100">${document.NAME }</td>
					<td width="100">${document.WRITEDAY }</td>
					<td width="100">${document.ENDDATE }</td>
					<td width="100">${document.STATUS }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div class="col-md-12" align="center">
	<ul id="pagination" class="pagination">
		
		<li><a href="${requestScope.paging.prevPage }" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
		<c:forEach var="pageNum" begin="${requestScope.paging.startPage }"
			end="${requestScope.paging.endPage }" step="1">
			<li id="pageNum"><a>${pageNum }</a></li>			
		</c:forEach>
		<li><a href="${requestScope.paging.nextPage }" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
	</ul>
</div>























