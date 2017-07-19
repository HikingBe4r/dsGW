<%-- nav.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>

<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<form action="${pageContext.request.contextPath }/logout.do"
		method="post">
	<div class="row">
		<!-- <div class="col-sm-1 col-md-1"></div> -->
		<div class="col-sm-7 col-md-7">
			<div class="thumbnail">
				<img src="resources/image/example.png" alt="..." id="profileImg">
			</div>
		</div>

		<div class="col-sm-3 col-md-3">
			<div class="panel panel-default">${sessionScope.admin.id }</div>
			<button class="btn btn-default" type="submit">로그아웃</button>
		</div>
	</div>
	<br> <br>




	<ul class="nav nav-pills nav-stacked">
		<li role="presentation"><a href="/groupware/registerEmployee.do">사원
				등록</a></li>
		<li role="presentation"><a href="/groupware/listEmployee.do">사원
				관리</a></li>
		<li role="presentation"><a href="/groupware/listEmpHistory.do">이력
				조회</a></li>
		<li role="presentation"><a href="/groupware/listDepartment.do">부서
				관리</a></li>
		<li role="presentation"><a href="">양식 관리</a></li>
	</ul>


</form>




