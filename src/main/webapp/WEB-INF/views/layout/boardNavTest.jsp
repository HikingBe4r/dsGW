<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import ="com.project.groupware.domain.BoardVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<script>
	$('#approval').removeAttr('class');
	$('#board').attr('class', 'active');
</script>

<html>
<div class="row">
	<!-- <div class="col-sm-1 col-md-1"></div> -->
	<div class="col-sm-7 col-md-7">
		<div class="thumbnail">
			<img src="resources/image/example.png" alt="..." id="profileImg">
		</div>
	</div>

	<div class="col-sm-3 col-md-3">
		<div class="panel panel-default">홍길동 사원</div>

		<button class="btn btn-default" type="submit">정보수정</button>
		<button class="btn btn-default" type="submit">로그아웃</button>
	</div>
</div>
<br><br>





	
	
	
	 <ul class="nav nav-pills nav-stacked">
	   <c:forEach var="board" items="${requestScope.boards}" varStatus="loop">
	         <li><a href="${pageContext.request.contextPath}/listArticleForm.do?boardId=${pageScope.board.id}&open=${pageScope.board.secret}">${pageScope.board.name}</a></li>
	   </c:forEach>
	</ul>
	
	
	

</html>