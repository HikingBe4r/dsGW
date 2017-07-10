<%-- addApprover.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<div class="col-md-5">
	<div class="panel panel-default">
		<div class="panel-body">
			<form class="navbar navbar-default">
				<div class="collapse navbar-collapse" id="navbar">
					<ul class="nav navbar-nav">
						<!-- <li class="active"><a href="#">결재자 <span class="sr-only">(current)</span></a></li> -->
						<li class="active"><a href="#">결재자 </a></li>
						<li><a href="#">수신자</a></li>
						<li><a href="#">즐겨찾기 설정</a></li>
					</ul>
				</div>
			</form>
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body" style="height: 550px;">
						<div class="checkbox">
							<span class="glyphicon glyphicon-folder-open" aria-hidden="true">
								IT부서 </span> <br> &nbsp; <span
								class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span>
							1팀 <br> &nbsp;&nbsp; <label> <input type="checkbox"
								value=""> 최길동 팀장
							</label> <br> &nbsp;&nbsp; <label> <input type="checkbox"
								value=""> 김길동 팀장
							</label><br> <span class="glyphicon glyphicon-triangle-bottom"
								aria-hidden="true"></span> 2팀 <br> &nbsp;&nbsp; <label>
								<input type="checkbox" value=""> 이길동 팀장
							</label> <br> &nbsp;&nbsp; <label> <input type="checkbox"
								value=""> 백길동 팀장
							</label><br>
							<br> <span class="glyphicon glyphicon-folder-open"
								aria-hidden="true"> 마케팅부서 </span> <br> &nbsp; <span
								class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span>
							1팀 <br> &nbsp;&nbsp; <label> <input type="checkbox"
								value=""> 한길동 팀장
							</label> <br>
							<br> <span class="glyphicon glyphicon-folder-open"
								aria-hidden="true"> 즐겨찾기 </span> <br> &nbsp; <span
								class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
							나의 결재선 <br>

						</div>

					</div>
				</div>
				<form class="form-inline pull-right">
					<select class="form-control">
						<option>이름</option>
						<option>부서</option>
					</select>

					<div class="form-group">
						<input type="text" class="form-control" id="searchKeyword"
							placeholder="keyword">
					</div>
					<button type="button" class="btn btn-default">검색</button>

				</form>
			</div>
		</div>
	</div>

</div>
<div class="col-md-1" align="center">
	<div style="height: 100px;"></div>
	<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><br>
	<br> <span class="glyphicon glyphicon-chevron-left"
		aria-hidden="true"></span>
</div>

<div class="col-md-6">
	<div class="panel panel-default" style="height: 600px;">
		<div class="panel-body">
			<div class="checkbox">
				<table class="table table-striped" align="center">
					<thead>
						<tr>
							<th></th>
							<th>이름</th>
							<th>직책</th>
							<th>부서</th>
							<th>상태</th>
						</tr>
					</thead>
					<tr>
						<td><label><input type="checkbox" value=""></label></td>
						<td>홍길동</td>
						<td>팀장</td>
						<td>IT</td>
						<td></td>
					</tr>
					<tr>
						<td><label><input type="checkbox" value=""></label></td>
						<td>박길동</td>
						<td>팀장</td>
						<td>마케팅</td>
						<td></td>
					</tr>

				</table>
			</div>

		</div>

	</div>
	<br><br>
	<button type="submit" class="btn btn-primary btn-lg pull-right">결재자 추가</button>
</div>



















