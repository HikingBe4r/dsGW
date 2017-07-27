<%-- nav.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>


<script>
	$('#approval').removeAttr('class');
	$('#board').attr('class', 'active');
</script>

<div class="row">
	<!-- <div class="col-sm-1 col-md-1"></div> -->
	<div class="col-sm-7 col-md-7">
		<div class="thumbnail">
			<c:if test="${sessionScope.employee == null}">
				<img src="${pageContext.request.contextPath }/resources/image/example.png" alt="..." id="profileImg">
			</c:if>
			<c:if test="${sessionScope.employee != null}">
				<img src="${pageContext.request.contextPath }/upload/empImage/${sessionScope.empImage1.systemFileName}" alt="..." id="profileImg">
			</c:if>
		</div>
	</div>

	<div class="col-sm-3 col-md-3">
		<div class="panel panel-default">홍길동 사원</div>

		<button class="btn btn-default" type="submit">정보수정</button>
		<button class="btn btn-default" type="submit">로그아웃</button>
	</div>
</div>
<br>
<br>


<div class="panel panel-info">
	<div class="panel-heading">
		<a href="#"><h4>공지사항</h4>
	</div>
	<div class="panel-body">
		<ul>
			<li><a href="#">전체 공지사항</a></li>
			<li><a href="#">부서별 공지사항</a></li>
		</ul>
	</div>
	<div class="panel-heading">
		<a href="#"><h4>게시글</h4>
	</div>
	<div class="panel-body">
		<ul>
			<li><a href="#">일반 게시판</a></li>
			<li><a href="#">Q&A 게시판</a></li>
		</ul>
	</div>

	<div class="panel-heading">
		<a href="#"><h4>관리자</h4>
	</div>
	

</div>