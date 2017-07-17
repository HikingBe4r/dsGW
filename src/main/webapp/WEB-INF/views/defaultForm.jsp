<%-- defaultForm.jsp --%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<style>
article {
		/* margin-left: 170px; */
		/* border-left: 1px solid gray; */
		/* padding: 1em; */
		overflow: hidden;
		height: 1000px;
	}
</style>
</head>
<body>
<div class="container">
	<article><tiles:insertAttribute name="content"/></article>
</div>
</body>
</html>




















	