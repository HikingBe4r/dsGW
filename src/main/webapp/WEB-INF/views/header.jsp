<%-- header.jsp --%>
<%@ page contentType="text/html; charset=utf-8" %>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>

<div class="col-md-11">
<ul class="nav nav-tabs">
		<li id="approval" role="presentation"><a href="choiceForm.do">전자결재</a></li>
		<li id="board" role="presentation"><a href="board.do">게시판</a></li>
</ul>
</div>



<div class="col-md-1">
	<!-- <button class="btn btn-default"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span></button> -->
	<!-- Single button -->
	<div class="btn-group">
  		<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
    		<span class="glyphicon glyphicon-cog" aria-hidden="true"> <span class="caret"></span>
    	</button>
			<ul class="dropdown-menu" role="menu">
				<li><a href="#">XX 설정</a></li>
				<li><a href="#">YY 설정</a></li>
			    <li><a href="${pageContext.request.contextPath }/approvalLineBookmark.do">결재선 즐겨찾기 설정</a></li>
			</ul>
	</div>
</div>