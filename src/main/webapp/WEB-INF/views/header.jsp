<%-- header.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>




<c:choose>
	<c:when test="${sessionScope.employee == null}">
		<div class="col-md-10">
			<ul class="nav nav-tabs">
				<li id="board" role="presentation"><a href="${pageContext.request.contextPath }/board.do">게시판</a></li>
				<li id="adminTab" role="presentation"><a href="${pageContext.request.contextPath}/listEmployee.do">관리자 전용</a></li>
			</ul>
		</div>
	</c:when>
	<c:otherwise>
		<div class="col-md-10">
			<ul class="nav nav-tabs">
				<li id="approval" role="presentation"><a href="${pageContext.request.contextPath }/choiceForm.do">전자결재</a></li>
				<li id="board" role="presentation"><a href="${pageContext.request.contextPath }/board.do">게시판</a></li>
			</ul>
		</div>
	</c:otherwise>
</c:choose>







<div class="col-md-2">
	<div class="btn-group">
		<button type="button" class="btn btn-default dropdown-toggle"
			data-toggle="dropdown" aria-expanded="false">
			<span class="glyphicon glyphicon-cog" aria-hidden="true"> <span
				class="caret"></span>
		</button>
		<ul class="dropdown-menu" role="menu">
			<li><a href="#">XX 설정</a></li>
			<li><a href="#">YY 설정</a></li>
			<li class="divider"></li>
			<li><a
				href="${pageContext.request.contextPath }/addApprovalLineBookmark.do">결재선
					즐겨찾기 추가</a></li>
			<li><a
				href="${pageContext.request.contextPath }/modifyApprovalLineBookmark.do">결재선
					즐겨찾기 수정</a></li>
			<li><a
				href="${pageContext.request.contextPath }/removeApprovalLineBookmark.do">결재선
					즐겨찾기 삭제</a></li>
		</ul>
	</div>
</div>