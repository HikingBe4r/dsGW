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
<script>
	function listNotice(data) {
		$("#tableBody").empty(data);
		var htmlStr = "";
		for (var i = data.paging.startArticleNum; i < data.paging.endArticleNum; i++) {

			htmlStr += "<tr>";
			htmlStr += "<td>" + "</td>";
			htmlStr += "<td>" + data.noticeList[i].content + "</td>";
			htmlStr += "<td><a href='/groupware/removeNotice.do?id=" + data.noticeList[i].id + "&currentPage=" + data.paging.currentPage +
					"'><button type='button' class='close' aria-label='Close'><span aria-hidden='true'>&times;</span></button></td>";
			htmlStr += "</tr>";
		}
		$("#tableBody").append(htmlStr);
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
	$(document).ready(
					function() {
						$
						.ajax({
							url : '${pageContext.request.contextPath}/listNoticePaging.do',
							method : 'GET',
							cache : false,
							dataType : 'json',
							data : {
								currentPage : "1"
							},
							success : function(data) {
								listNotice(data);
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
						
						$("#pagination")
								.on(
										"click",
										"li",
										function() {
											$
													.ajax({
														url : '${pageContext.request.contextPath}/listNoticePaging.do',
														method : 'GET',
														cache : false,
														dataType : 'json',
														data : {
															currentPage : $(
																	this).val()
														},
														success : function(data) {
															listNotice(data);
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
				<table class="table" id="table">
					<thead>
						<tr>
							<th>읽음</th>
							<th>내용</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody id="tableBody">
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