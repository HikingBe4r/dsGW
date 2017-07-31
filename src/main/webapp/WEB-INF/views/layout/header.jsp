<%-- header.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>




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
				<li id="approval" role="presentation"><a href="${pageContext.request.contextPath }/listNotice.do">전자결재</a></li>
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
			<li onclick="window.open('${pageContext.request.contextPath }/modifyEmployee.do?id=${sessionScope.employee.id }', 
				'개인정보수정','width=1250, height=900, toolbar=no, menubar=no, scrollbars=no, resizable=yes');return false;">
				<a href="#">개인정보 수정</a></li>
			<li class="divider"></li>
			<li><a href="${pageContext.request.contextPath }/addApprovalLineBookmark.do">결재선 즐겨찾기 추가</a></li>
			<li><a href="${pageContext.request.contextPath }/modifyApprovalLineBookmark.do">결재선 즐겨찾기 수정</a></li>
			<li><a href="${pageContext.request.contextPath }/removeApprovalLineBookmark.do">결재선 즐겨찾기 삭제</a></li>
			<li class="divider"></li>
			<li><a href="${pageContext.request.contextPath }/logout.do">로그아웃</a></li>
		</ul>
	</div>
</div>