<%-- header.jsp --%>
<%@ page contentType="text/html; charset=utf-8" %>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>

<script>
$(document).ready(function() {
	$('#approval').on('click', function() {
		$('#board').removeAttr('class');
		$(this).attr('class', 'active');
		location.href = 'choiceForm.do';
	});
	
	$('#board').on('click', function() {
		$('#approval').removeAttr('class');
		$(this).attr('class', 'active');
		location.href = 'board.do';
	});
})
	
</script>


<ul class="nav nav-tabs">
		<li id="approval" role="presentation"><a href="#">전자결재</a></li>
		<li id="board" role="presentation"><a href="#">게시판</a></li>
</ul>











	