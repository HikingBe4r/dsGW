<%-- header.jsp --%>
<%@ page contentType="text/html; charset=utf-8" %>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>

<div class="col-md-10">
<ul class="nav nav-tabs">
		<li id="approval" role="presentation"><a href="choiceForm.do">전자결재</a></li>
		<li id="board" role="presentation"><a href="board.do">게시판</a></li>
</ul>
</div>



<div class="col-md-2">
	<div class="btn-group">
  		<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
    		<span class="glyphicon glyphicon-cog" aria-hidden="true"> <span class="caret"></span>
    	</button>
			<ul class="dropdown-menu" role="menu">
				<li><a href="#">XX 설정</a></li>
				<li><a href="#">YY 설정</a></li>
				<li class="divider"></li>
			    <li><a href="${pageContext.request.contextPath }/addApprovalLineBookmark.do">결재선 즐겨찾기 추가</a></li>
			    <li><a href="${pageContext.request.contextPath }/modifyApprovalLineBookmark.do">결재선 즐겨찾기 수정</a></li>
			    <li><a href="${pageContext.request.contextPath }/removeApprovalLineBookmark.do">결재선 즐겨찾기 삭제</a></li>
			</ul>
	</div>
</div>