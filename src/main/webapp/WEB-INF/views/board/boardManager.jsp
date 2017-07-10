<%-- boardManager.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>



<a></a>
<div class="panel panel-default">
	<div class="panel-body">관리자</div>
</div>


<div class="panel panel-default">
	<div class="panel-body">
		<table class="table table-hover" align="center" style="height: 300px;">
			<thead>
				<tr>
					<th>게시판 이름</th>
					<th>비고</th>
					<th width="200">수정</th>
					<th width="200">삭제</th>
				</tr>
			</thead>
			<tr>
				<td>공지사항</td>
				<td>설명 : 전체공지사항</td>
				<td><button type="button" class="btn btn-default">수정</button></td>
				<td><button type="button" class="btn btn-danger">삭제</button></td>

			</tr>
		</table>

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
	</div>

</div>

<div class="panel panel-default">
	<div class="panel-body" style="height: 200px;">

		<form class="form-horizontal">
			<div class="form-group">
				<label for="inputSubject" class="col-sm-2 control-label">제목</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" id="inputSubject">
				</div>
			</div>
			<div class="form-group">
				<label for="inputContent" class="col-sm-2 control-label">비고</label>
				<div class="col-sm-7">
					<textarea class="form-control" rows="3"></textarea>		
				</div>
				<div class="col-sm-3">
					<button type="submit" class="btn btn-default btn-lg">등록</button>
				</div>
			</div>
		</form>
	</div>
</div>




















