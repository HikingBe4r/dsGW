<%-- nav.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>

<link href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<script>
	$('#board').removeAttr('class');
	$('#adminTab').attr('class', 'active');
	$('#settingGroup').empty();
	$('#settingGroup').append('<li><a href="${pageContext.request.contextPath }/logout.do">로그아웃</a></li>');
</script>

	<div class="row">
		<div class="col-md-6">
			<div class="thumbnail">
				<img src="${pageContext.request.contextPath }/resources/image/example.png" id="profileImg">
			</div>
		</div>
		<br>
		<div style="height: 70px;">
			<h2>&nbsp;&nbsp;&nbsp;${sessionScope.admin.id }</h2>
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




