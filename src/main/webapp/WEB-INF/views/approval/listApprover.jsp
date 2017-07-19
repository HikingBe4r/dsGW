<%-- addApprover.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>

<div style="height: 10px;"></div>
<div class="col-md-5">
	<div class="panel panel-default">
		<div class="panel-body">
			<form class="navbar navbar-default col-md-12">
				<div class="collapse navbar-collapse" id="navbar">
					<ul class="nav navbar-nav">
						<li id="approverTap" class="active" ><a href=#>결재자</a></li>
						<li id="recieverTap"><a href=#>수신자</a></li>
					</ul>
				</div>
			</form>
		</div>
	</div>

</div>
<div class="col-md-1" align="center">
	<div style="height: 100px;"></div>
	<span id="addBtn" class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><br>
	<br> <span id="removeBtn" class="glyphicon glyphicon-chevron-left"
		aria-hidden="true"></span>
</div>

<div class="col-md-6">
	<div class="panel panel-default" style="overflow:scroll; height: 380px;"> <!-- 여기 -->
		<div class="panel-body">
			<div class="checkbox">
				<table id="approverTable" class="table table-striped" align="center">
					<thead>
						<tr>
							<th></th>
							<th>이름</th>
							<th>직책</th>
							<th>부서</th>
							<th>구분</th>
						</tr>
					</thead>
				</table>
			</div>

		</div>

	</div>
	<br><br>
	<button type="button" id="submitBtn" class="btn btn-primary btn-lg pull-right">결재선 등록</button>
</div>



















