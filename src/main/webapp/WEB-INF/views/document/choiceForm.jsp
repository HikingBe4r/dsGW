<%-- choiceForm.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

<script>
$(document).ready(function() {
	var pagePerRecord = 10;
	var blockPerPage = 3;
	var currentPage = 1;
	var totalRecord = 0;
		
})
</script>
	


<div>
	<h3>&nbsp;&nbsp;&nbsp;&nbsp;새 기안 양식 선택</h3>
	<form class="form-inline pull-right">
		<div class="form-group">
			<input type="text" class="form-control" id="searchKeyword"
				placeholder="keyword">
		</div>
		<button type="button" class="btn btn-default">검색</button>
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
		<tbody id="formBody">
			<c:forEach var="form" items="${requestScope.formList }"
				varStatus="loop">
				<tr>
					<td>${form.id }</td>
					<c:url var="url" value="/writeDocument.do">
						<c:param name="id" value="${pageScope.form.id}"></c:param>
					</c:url>
					<td><a href="${url }">${form.subject }</a></td>
					<td>${form.writeday }</td>
					<td>${form.hitcount }</td>
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























