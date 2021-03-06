<%-- loginForm.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js"></script>

<script>
	function listDepartment(data) {
		$("#tableBody").empty(data);
		var htmlStr = "";
		if (data.departmentList.length == 0) {
			alert("검색결과가 없습니다.");
		}

		for (var i = data.paging.startArticleNum; i <= data.paging.endArticleNum; i++) {

			htmlStr += "<tr onclick=\"location=\'/groupware/detailDepartment.do?id="
					+ data.departmentList[i].id + "\'\">";
			htmlStr += "<td>" + data.departmentList[i].id + "</td>";
			htmlStr += "<td>" + data.departmentList[i].name + "</td>";

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
						$.ajax({
							url : '${pageContext.request.contextPath}/searchDepartment.do',
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
								listDepartment(data);
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
														url : '${pageContext.request.contextPath}/searchDepartment.do',
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
															listDepartment(data);
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
												url : '${pageContext.request.contextPath}/searchDepartment.do',
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
													currentPage : $(this).val()
												},
												success : function(data) {
													listDepartment(data);
													pagination(data);
												},
												error : function(jqXHR) {
													alert("ERROR: "
															+ jqXHR.responseText);
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
						<option value="id">부서 번호</option>
						<option value="name">부서 이름</option>
					</select>
				</div>
				<div style="float: left">
					<button class="btn btn-primary" id="insertBtn"
						onclick="window.open('${pageContext.request.contextPath }/registerDepartment.do','사번/비밀번호 찾기','width=600, height=300, toolbar=no, menubar=no, scrollbars=no, resizable=yes');return false;">부서등록</button>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table" id="table">
				<thead>
					<tr>
						<th>부서 번호</th>
						<th>부서 이름</th>
					</tr>
				</thead>
				<tbody id="tableBody">
					<c:forEach var="departmentList"
						items="${requestScope.departmentList }" varStatus="loop">
						<c:url var="url" value="/detailDepartment.do">
							<c:param name="id" value="${pageScope.departmentList.id }" />
						</c:url>
						<tr onclick="location='${pageScope.url}'">
							<td>${pageScope.departmentList.id }</td>
							<td>${pageScope.departmentList.name }</td>
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