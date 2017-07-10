<%-- deptInfoBoard.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>



<a></a>
<div class="panel panel-default">
	<div class="panel-body">부서별 공지사항</div>
</div>
<div>
	<form class="form-inline pull-right">
	
		<select class="form-control">
			<option>부서</option>
		</select> 
		<select class="form-control">
			<option>제목</option>
			<option>작성자</option>
			<option>내용</option>
			<option>번호</option>
		</select>
	
	
		<div class="form-group">
			<input type="text" class="form-control" id="searchKeyword"
				placeholder="keyword">
		</div>
		<button type="button" class="btn btn-default">검색</button>
	</form>
</div>
<br><br>

<div style="height: 550px;">
<div class="checkbox">
<table class="table table-hover" align="center">
	<thead>
	<tr>
		<th width="50"></th>
		<th width="100">번호</th>
		<th>제목</th>
		<th width="200">이름</th>
		<th width="200">날짜</th>
		<th width="100">조회수</th>
		<th width="100">파일</th>
	</tr>
	</thead>
	<tr>
		<td><label><input type="checkbox" id=""></label></td>
		<td>17</td>
		<td>게시판17</td>
		<td>홍길동</td>
		<td>2017-08-21</td>
		<td>30</td>
		<td></td>
	</tr>
	<tr>
		<td><label><input type="checkbox" value="" id=""></label></td>
		<td>16</td>
		<td>게시판16</td>
		<td>흥부</td>
		<td>2017-08-20</td>
		<td>33</td>
		<td><span class="glyphicon glyphicon-save" aria-hidden="true"></span></td>
	</tr>
	

</table>
</div>
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
	<div class="pull-right">
		<button type="button" class="btn btn-default">삭제</button>
		<button type="button" class="btn btn-default">글쓰기</button>
	</div>
</div>























