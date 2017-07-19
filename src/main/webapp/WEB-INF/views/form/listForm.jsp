<%-- listForm.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {
		$("#regBtn").click(function() {
			document.location.href='${pageContext.request.contextPath}/registerForm.do';
		});
	});

</script>


<div>
	<h3>양식 목록</h3>
	<form class="form-inline pull-right">
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
	<table class="table table-striped" align="center">
		<thead>
			<tr>
				<th width="100">번호</th>
				<th>제목</th>
				<th width="200">등록일</th>
				<th width="100">조회수</th>
			</tr>
		</thead>
		<c:forEach var="form" items="${requestScope.formList }"
			varStatus="loop">
			<tr>
				<td>${form.id }</td>
				<c:url var="url" value="/detailForm.do">
					<c:param name="formId" value="${pageScope.form.id }"></c:param>
				</c:url>
				<td><a href="${url }">${form.subject }</a></td>
				<td>${form.writeday }</td>
				<td>${form.hitcount }</td>
			</tr>
		</c:forEach>
	</table>
</div>

<div align="right">
	<button type="button" class="btn btn-primary" id="regBtn">등록</button>
	<button type="button" class="btn btn-danger" id="removeBtn">삭제</button>
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























