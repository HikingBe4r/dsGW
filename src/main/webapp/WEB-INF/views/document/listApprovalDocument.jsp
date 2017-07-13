<%-- listApprovalDocument.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js?ver=2"></script>


<script>
	function listApprovalDocument(data) {
		$("#document").empty(data);
		var htmlStr = "";
		
		for(var i = 0; i < data.documentList.length; i++) {
			
			htmlStr += '<tr align="center">';
			htmlStr += '<td width="100">'+data.documentList[i].ID+'</td>';
			htmlStr += '<td>'+data.documentList[i].SUBJECT+'</td>';
			htmlStr += '<td width="100">'+data.documentList[i].NAME +'</td>';
			htmlStr += '<td width="100">'+data.documentList[i].WRITEDAY +'</td>';
			htmlStr += '<td width="100">'+data.documentList[i].ENDDATE +'</td>';
			htmlStr += '<td width="100">'+data.documentList[i].STATUS +'</td>';
			htmlStr += '</tr>';
			
		}
		
		$("#documents").append(htmlStr);
	}

	$(document).ready(function() {
		$("#searchBtn").click(function() {
			$.ajax({
				url : '${pageContext.request.contextPath}/searchListApprovalDocument.do'
				,
				method : 'GET'
				,
				cache : false
				,
				dataType : 'json'
				,
				data : {
					kind: $("#KIND").val(),
					keyword: $("#searchKeyword").text()
				}
				,
				success : function(data) {
					listApprovalDocument(data);
					alert("성공?");
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

		<select class="form-control" name="KIND" id="KIND">
			<option id="1">전체</option>
			<option id="2">제목</option>
			<option id="3">작성자</option>
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
				<tr align="center">
					<td width="100">${document.ID}</td>
					<td>${document.SUBJECT }</td>
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























