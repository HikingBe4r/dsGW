<%-- nav.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>

<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>

<script>
	$('#approval').attr('class', 'active');
</script>


<div class="row">
	<div class="col-md-7">
		<div class="thumbnail">
			<img src="resources/image/example.png" alt="..." id="profileImg">
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
<br>




<ul class="nav nav-pills nav-stacked">
	<li role="presentation" class="active"><a href="${pageContext.request.contextPath }/choiceForm.do">새 결재</a></li>
	<li role="presentation" ><a href="#" >자주쓰는 양식</a></li>
	<li role="presentation"><a href="#">결재하기</a></li>
	<li role="presentation"><a href="${pageContext.request.contextPath }/approvalLineBookmark.do">결재선 즐겨찾기 설정</a></li>
</ul>







