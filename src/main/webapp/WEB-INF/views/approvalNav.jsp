<%-- nav.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	setInterval(function() {
		$.ajax({
			url : '${pageContext.request.contextPath}/refreshNav.do',
			method : 'GET',
			cache : false,
			dataType : 'json',
			data : {
				
			},
			success : function(data) {
				$('#notice').empty(data);
				var htmlStr = "";
				htmlStr += "<form action='${pageContext.request.contextPath }/listNotice.do' method='get'>"
				if(data.isread == '0'){
					htmlStr += "<input class='btn btn-default' type='submit' value='알림 : "+ data.isread +"'>"
					//htmlStr += "<input class='btn btn-default' type='submit' value='알림 : ${requestScope.isread }'>"
				}else{
					
					htmlStr += "<input class='btn btn-warning' type='submit' value='알림 : "+ data.isread +"'>"
					//htmlStr += "<input class='btn btn-warning' type='submit' value='알림 : ${requestScope.isread }'>"
					
				}
				htmlStr += "</form>"
				$('#notice').append(htmlStr);
			},
			error : function(request, status, error) {
				console.log("code:" + request.status
						+ "\n" + "message:"
						+ request.responseText + "\n"
						+ "error:" + error);
			}
		});
	}, 30000);
</script>


<div class="row">
	<div class="col-md-6">
		<div class="thumbnail">
			<img src="resources/image/example.png" alt="..." id="profileImg"
				style="height: 150px;">
		</div>
	</div>

	<div class="col-md-5" id="notice">
		<c:choose>
			<c:when test="${requestScope.isread == '0'}">
				<form action="${pageContext.request.contextPath }/listNotice.do"
					method="get">
					<input class="btn btn-default" type="submit"
						value="알림 : ${requestScope.isread }">
				</form>
			</c:when>
			<c:otherwise>
				<form action="${pageContext.request.contextPath }/listNotice.do"
					method="get">
					<input class="btn btn-warning" type="submit"
						value="알림 : ${requestScope.isread }">
				</form>
			</c:otherwise>
		</c:choose>
	</div><br><br>
	<div id="employeeInfo" style="height: 70px;">
		<h5>${sessionScope.employeeDetail.departmentId }</h5>
		<h4>${sessionScope.employeeDetail.name }
			${sessionScope.employeeDetail.gradeId }</h4>
	</div>

	<button id="modifyInfo" class="btn btn-default" type="button">정보수정</button>
	<form action="${pageContext.request.contextPath }/logout.do"
		method="post">
		<input id="logout" class="btn btn-default" type="submit" value="로그아웃">
	</form>
</div>
<br>
<button id="writeDocument" type="button"
	class="btn btn-success btn-lg btn-block" style="height: 50px;">+
	새 기안서</button>
<br>


<div class="panel panel-info">
	<div class="panel-heading">
		<h4>문서 양식</h4>
	</div>
	<div class="panel-body">
		<ul>
			<li><a
				href="${pageContext.request.contextPath }/listForm.do?boardId=1">전체
					양식</a></li>
			<li><a
				href="${pageContext.request.contextPath }/listForm.do?boardId=2">즐겨찾기</a></li>
		</ul>
	</div>
	<div class="panel-heading">
		<h4>결재문서함</h4>
	</div>
	<div class="panel-body">
		<ul>
			<li><a
				href="${pageContext.request.contextPath }/listApprovalDocument.do?boardId=1">결재문서</a></li>
			<li><a
				href="${pageContext.request.contextPath }/listApprovalDocument.do?boardId=2">수신문서</a></li>
			<li><a
				href="${pageContext.request.contextPath }/listApprovalDocument.do?boardId=3">미완료문서</a></li>
			<li><a
				href="${pageContext.request.contextPath }/listApprovalDocument.do?boardId=4">기안문서</a></li>
		</ul>
	</div>
	<div class="panel-heading">
		<h4>개인문서함</h4>
	</div>
	<div class="panel-body">
		<ul>
			<li><a href="#">임시보관</a></li>
			<li><a href="#">개인보관</a></li>
			<li><a href="#">승인문서</a></li>
			<li><a href="#">반려문서</a></li>
			<li><a href="#">수신문서</a></li>
		</ul>
	</div>

</div>