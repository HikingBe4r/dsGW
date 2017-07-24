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
	function listEmployee(data) {
		$("#tableBody").empty(data);
		var htmlStr = "";
		if (data.employeeList.length == 0) {
			alert("검색결과가 없습니다.");
		}

		for (var i = data.paging.startArticleNum; i < data.paging.endArticleNum; i++) {

			htmlStr += "<tr onclick=\"location=\'/groupware/modifyEmployee.do?id="
					+ data.employeeList[i].ID + "\'\">";
			htmlStr += "<td>" + data.employeeList[i].ID + "</td>";
			htmlStr += "<td>" + data.employeeList[i].NAME + "</td>";
			htmlStr += "<td>" + data.employeeList[i].DEPARTMENT + "</td>";
			htmlStr += "<td>" + data.employeeList[i].HIREDATE + "</td>";
			htmlStr += "<td>" + data.employeeList[i].GRADE + "</td>";
			htmlStr += "<td>" + data.employeeList[i].STATUS + "</td>";

			htmlStr += "</tr>";
		}
		$("#tableBody").append(htmlStr);
		$("#keyword").val('');
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
		for (var i = data.paging.startPage; i <= data.paging.endPage; i++) {
			if (data.paging.currentPage == i) {
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
	}
	$(document)
			.ready(
					function() {
						$
								.ajax({
									url : '${pageContext.request.contextPath}/searchEmployee.do',
									method : 'GET',
									cache : false,
									dataType : 'json',
									data : {
										keyfield : $(
												"select[name='keyfield'] > option:selected")
												.val(),
										keyword : $(":text[name='keyword']")
												.val(),
										currentPage : "1"
									},
									success : function(data) {
										listEmployee(data);
										pagination(data);
									},
									error : function(request, status, error) {
										alert("code:" + request.status + "\n"
												+ "message:"
												+ request.responseText + "\n"
												+ "error:" + error);
										console.log("code:" + request.status
												+ "\n" + "message:"
												+ request.responseText + "\n"
												+ "error:" + error);
									}
								});

						$('#searchBtn')
								.click(
										function() {
											$
													.ajax({
														url : '${pageContext.request.contextPath}/searchEmployee.do',
														method : 'GET',
														dataType : 'json',
														data : {
															keyfield : $(
																	"select[name='keyfield'] > option:selected")
																	.val(),
															keyword : $(
																	":text[name='keyword']")
																	.val(),
															currentPage : "1"
														},
														cache : false,
														success : function(data) {
															listEmployee(data);
															pagination(data);
														},
														error : function(jqXHR) {
															alert("Error : "
																	+ jqXHR.responseText);
														}

													});
										});
						$("#pagination")
								.on(
										"click",
										"li",
										function() {
											$
													.ajax({
														url : '${pageContext.request.contextPath}/searchEmployee.do',
														method : 'GET',
														cache : false,
														dataType : 'json',
														data : {
															keyfield : $(
															"select[name='keyfield'] > option:selected")
															.val(),
													keyword : $(
															":text[name='keyword']")
															.val(),
															currentPage : $(
																	this).val()
														},
														success : function(data) {
															listEmployee(data);
															pagination(data);
														},
														error : function(jqXHR) {
															alert("ERROR: "
																	+ jqXHR.responseText);
															console
																	.log(jqXHR.responseText);
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
					<thead>
						<tr>
							<th>사번</th>
							<th>이름</th>
							<th>부서</th>
							<th>입사일</th>
							<th>직급</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody id="tableBody">

						<c:forEach var="employeeList"
							items="${requestScope.employeeList }" varStatus="loop">
							<c:url var="url" value="/modifyEmployee.do">
								<c:param name="id" value="${pageScope.employeeList.ID }" />
							</c:url>
							<tr onclick="location='${pageScope.url}'">
								<td>${pageScope.employeeList.ID }</td>
								<td>${pageScope.employeeList.NAME }</td>
								<td>${pageScope.employeeList.DEPARTMENT }</td>
								<td>${pageScope.employeeList.HIREDATE }</td>
								<td>${pageScope.employeeList.GRADE }</td>
								<td>${pageScope.employeeList.STATUS }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<div class="py-5">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<ul id="pagination" class="pagination">
					<li><a href="${requestScope.paging.prevPage }"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
					<c:forEach var="pageNum" begin="${requestScope.paging.startPage }"
						end="${requestScope.paging.endPage }" step="1">
						<li id="pageNum"><a>${pageNum }</a></li>
					</c:forEach>
					<li><a href="${requestScope.paging.nextPage }"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
				</ul>
			</div>
		</div>
	</div>
</div>