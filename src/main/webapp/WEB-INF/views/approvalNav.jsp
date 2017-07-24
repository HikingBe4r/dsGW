<%-- nav.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>

<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>

<script>
	$('#board').removeAttr('class');
	$('#approval').attr('class', 'active');
	
	$(document).ready(function() {
		$('#writeDocument').on('click', function() {
			location.href = 'choiceForm.do';
		});
	});
	
</script>


<div class="row">
	<div class="col-md-6">
		<div class="thumbnail">
			<img src="resources/image/example.png" alt="..." id="profileImg"  style="height: 150px;">
		</div>
	</div>

	<div class="col-md-5">
		<div id="employeeInfo" style="height: 70px;">		
			<h5>${sessionScope.employeeDetail.departmentId }</h5> 
			<h4>${sessionScope.employeeDetail.name } ${sessionScope.employeeDetail.gradeId }</h4> 		
		</div>

		<button id="modifyInfo" class="btn btn-default" type="button">정보수정</button>
		<form action="${pageContext.request.contextPath }/logout.do" method="post">
			<input id="logout" class="btn btn-default" type="submit" value="로그아웃">
		</form>
	</div>
</div>
<br>	
<button id="writeDocument" type="button" class="btn btn-success btn-lg btn-block" style="height: 50px;">+ 새 기안서</button>
<br>


<div class="panel panel-info">
	<div class="panel-heading">
		<h4>결재</h4>
	</div>
	<div class="panel-body">
		<ul>
			<li><a href="#">결재하기</a></li>
			<li><a href="#">결재하기</a></li>
			<li><a href="#">결재하기</a></li>
			<li><a href="#">결재하기</a></li>
			<li><a href="#">결재하기</a></li>
		</ul>
	</div>
	<div class="panel-heading">
		<h4>문서함</h4>
	</div>
	<div class="panel-body">
		<ul>
			<li><a href="#">승인 문서함</a></li>
			<li><a href="#">승인 문서함</a></li>
			<li><a href="#">승인 문서함</a></li>
			<li><a href="#">승인 문서함</a></li>
			<li><a href="#">승인 문서함</a></li>
			<li><a href="#">승인 문서함</a></li>
		</ul>
	</div>

	<div class="panel-heading">
		<h4>환경설정</h4>
	</div>
	<div class="panel-body">
		<ul>
			<li><a href="${pageContext.request.contextPath }/approvalLineBookmark.do">결재선 즐겨찾기 설정</a></li>
		</ul>
	</div>
</div>