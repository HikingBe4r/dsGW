<%-- listForm.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>



<div>
	<h3>양식 목록</h3>
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
		<tr>
			<td>1</td>
			<td>양식1</td>
			<td>2017-07-07</td>
			<td>30</td>
		</tr>
		<tr>
			<td>2</td>
			<td>양식2</td>
			<td>2017-07-07</td>
			<td>30</td>
		</tr>
		<tr>
			<td>3</td>
			<td>양식3</td>
			<td>2017-07-07</td>
			<td>30</td>
		</tr>

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























