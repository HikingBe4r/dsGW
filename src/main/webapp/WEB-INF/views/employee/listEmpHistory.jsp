<%-- loginForm.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
<script
	src="https://pingendo.com/assets/bootstrap/bootstrap-4.0.0-alpha.6.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script charset="UTF-8" type="text/javascript"
	src="http://s1.daumcdn.net/svc/attach/U03/cssjs/postcode/1495012223804/170517.js"></script>
<script>
	$(document).ready(function() {
		$('#searchBtn').click(function() {
			$.ajax({
				url: '${pageContext.request.contextPath}/searchEmpHistory.do'
				,
				method: 'GET'
				,
				dataType: 'json'
				,
				data: {
					keyfield:  $("select[name='keyfield'] > option:selected").val() ,
					keyword:  $(":text[name='keyword']").val()					
				}
				, 
				cache: false
				,
				success: function(data) {
					$('#table').find('tr:first').nextAll().remove();
					
					var htmlStr = "";
					for(var i=0; i<data.empHistoryList.length; i++) {
						htmlStr += "<tr>";
						htmlStr += "<td>" + data.empHistoryList[i].employee.id + "</td>";
						htmlStr += "<td>" + data.empHistoryList[i].employee.name + "</td>";
						htmlStr += "<td>" + data.empHistoryList[i].startDate + "</td>";
						htmlStr += "<td>" + data.empHistoryList[i].endDate + "</td>";
						htmlStr += "<td>" + data.empHistoryList[i].kind + "</td>";
						htmlStr += "<td>" + data.empHistoryList[i].oldContent + "</td>";
						htmlStr += "<td>" + data.empHistoryList[i].newContent + "</td>";
						htmlStr += "</tr>";
					}
					
					$('#table').find('tr:first').after(htmlStr);
					
				}
				,
				error : function(jqXHR) {
					alert("Error : " + jqXHR.responseText);
				}				
				
			});			
		});		
	});
</script>
<div class="py-5">
	<br>
	<div class="container">
		<div class="row">

			<div class="col-md-12">
				<div style="float: right">
					<button class="btn btn-primary" id="searchBtn">검색</button>
				</div>
				<div style="float: right">
					<input type="text" class="form-control" name="keyword"
						placeholder="검색어">

				</div>
				<div style="float: right">
					<select class="btn btn-primary dropdown-toggle" name="keyfield">
						<option value="id">사번</option>
						<option value="name">이름</option>
						<option value="departmentId">부서</option>
						<option value="hireDate">입사일</option>
						<option value="gradeId">직급</option>
					</select>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table" id="table">
						<tr>
							<th>사번</th>
							<th>이름</th>
							<th>이전변경일</th>
							<th>최종변경일</th>
							<th>분류</th>
							<th>이전변경점</th>
							<th>현재변경점</th>
						</tr>
						<c:forEach var="EmpHistoryList"
							items="${requestScope.EmpHistoryList }" varStatus="loop">
							<tr>
								<td>${pageScope.EmpHistoryList.employee.id }</td>
								<td>${pageScope.EmpHistoryList.employee.name }</td>
								<td>${pageScope.EmpHistoryList.startDate }</td>
								<td>${pageScope.EmpHistoryList.endDate }</td>
								<td>${pageScope.EmpHistoryList.kind }</td>
								<td>${pageScope.EmpHistoryList.oldContent }</td>
								<td>${pageScope.EmpHistoryList.newContent }</td>
							</tr>
						</c:forEach>
				</table>
			</div>
		</div>
	</div>
</div>
<div class="py-5">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">«</span> <span
							class="sr-only">Previous</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">»</span> <span
							class="sr-only">Next</span>
					</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>