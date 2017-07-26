<%-- nav.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>

<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<form action="${pageContext.request.contextPath }/logout.do"
	method="post">
	<div class="row">
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



	<div class="panel panel-info">
		<div class="panel-heading">
			<h4>관리자 모드</h4>
		</div>
		<ul class="nav nav-pills nav-stacked">
			<li role="presentation"><a href="${pageContext.request.contextPath }/registerEmployee.do">사원
					등록</a></li>
			<li role="presentation"><a href="${pageContext.request.contextPath }/listEmployee.do">사원
					관리</a></li>
			<li role="presentation"><a href="${pageContext.request.contextPath }/listEmpHistory.do">이력
					조회</a></li>
			<li role="presentation"><a href="${pageContext.request.contextPath }/listDepartment.do">부서
					관리</a></li>
			<li role="presentation"><a href="${pageContext.request.contextPath }/listForm.do?boardId=1">양식 관리</a></li>
		</ul>
	</div>




</form>




