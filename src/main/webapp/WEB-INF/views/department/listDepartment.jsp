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
	$(document)
			.ready(
					function() {
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
																	.val()
														},
														cache : false,
														success : function(data) {
															$('#table').find(
																	'tr:first')
																	.nextAll()
																	.remove();

															var htmlStr = "";
															for (var i = 0; i < data.departmentList.length; i++) {
																htmlStr += "<tr onclick=\"location=\'/groupware/detailDepartment.do?id="
																		+ data.departmentList[i].id
																		+ "\'\">";
																htmlStr += "<td>"
																		+ data.departmentList[i].id
																		+ "</td>";
																htmlStr += "<td>"
																		+ data.departmentList[i].name
																		+ "</td>";

																htmlStr += "</tr>";
															}

															$('#table')
																	.find(
																			'tr:first')
																	.after(
																			htmlStr);

														},
														error : function(jqXHR) {
															alert("Error : "
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
					<tr>
						<th>부서 번호</th>
						<th>부서 이름</th>
					</tr>
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