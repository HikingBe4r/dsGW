<%-- addApprover.jsp --%>

<!-- 
	ajax로 결재자, 수신자 클릭할때마다
	해당 문서의 결재자list, 수신자list 출력
	결재자: 이름, 직책, 부서, 상태(결재, 대기, -, -)
	수신자: 이름, 직책, 부서, 수신---
 -->
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>

<script>
	$(document).ready(function() {
		function setApproverList(data) {
			$('#approvers').empty(data);
			
			var htmlStr = "";
			for(var i = 0; i < data.approverList.length; i++) {
				
				htmlStr += '<tr>';
				htmlStr += '<td>'+ data.approverList[i].EMPNAME +'</td>';
				htmlStr += '<td>'+ data.approverList[i].GRADE +'</td>';
				htmlStr += '<td>'+ data.approverList[i].DEPTNAME +'</td>';
				htmlStr += '<td>'+ data.approverList[i].AUTH +'</td>';								
				htmlStr += '</tr>'
				
			}
			
			$("#approvers").append(htmlStr);
		}	
		
		
	
		$("#approverTap").on("click", function() {
			$.ajax ({
				url: '${pageContext.request.contextPath}/listApprover.do' 
				,
				method: 'POST'
				,
				dataType: 'json'
				,
				data: {
					kind : 1,
					documentId: '${param.documentId}'
				}
				,
				cache: false
				,
				success: function(data) {
					setApproverList(data);
				}
				,
				error : function(jqXHR) {
					alert("ERROR: " + jqXHR.responseText);
				}
			});
		});
				
		$("#recieverTap").on("click", function() {
			$.ajax ({
				url: '${pageContext.request.contextPath}/listApprover.do' 
				,
				method: 'POST'
				,
				dataType: 'json'
				,
				data: {
					kind : 2,
					documentId: '${param.documentId}'
				}
				,
				cache: false
				,
				success: function(data) {
					setApproverList(data);
				}
				,
				error : function(jqXHR) {
					alert("ERROR: " + jqXHR.responseText);
				}
			});
		});
	});

</script>

<div style="height: 10px;"></div>
<div class="col-md-12">
	<div class="panel panel-default" style="overflow: scroll; height: 380px;"> 
		<div class="panel-body">
			<form class="navbar navbar-default col-md-12">
				<div class="collapse navbar-collapse" id="navbar">
					<ul class="nav navbar-nav">
						<li id="approverTap" class="active"><a href=#>결재자</a></li>
						<li id="recieverTap"><a href=#>수신자</a></li>
					</ul>
				</div>
			</form>
			
			<!-- 리스트 출력부 -->
			<div>
				<table id="approverTable" class="table table-striped">
					<thead>
						<tr>
							<th>이름</th>
							<th>직책</th>
							<th>부서</th>
							<th>구분</th>
						</tr>
					</thead>
					<tbody id="approvers">
						<c:forEach var="approver" items="${requestScope.approverList }" varStatus="loop">
						<c:if test="${approver.AUTH != '수신' }">
							<tr>
								<td>${approver.EMPNAME }</td>
								<td>${approver.GRADE }</td>
								<td>${approver.DEPTNAME }</td>
								<td>${approver.AUTH }</td>								
							</tr>
						</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>



















