<%-- layout.jsp --%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<style>
	div.container {
		width: 95%;
		border: 1px solid gray;
		margin: auto; 
	}

	header {
		height: 80px;
		padding: 1em;
		color: black;
		background-color: white;
		clear: left;
		text-align: center;
	}
	
	footer {
		height: 60px;
		padding: 1em;
		color: black;
		background-color: white;
		clear: left;
		text-align: center;	
	}

	nav {
		float: left;
		max-width: 300px;
		margin: 0;
		padding: 1em;
	}

	nav ul {
		list-style-type: none;
		padding: 0;
	}
	   
	nav ul a {
		text-decoration: none;
	}

	article {
		/* margin-left: 170px; */
		/* border-left: 1px solid gray; */
		padding: 1em;
		overflow: hidden;
		height: 820px;
	}
</style>
</head>
<body>
<div class="container">
	<header><tiles:insertAttribute name="header"/></header>  
	<nav><tiles:insertAttribute name="nav"/></nav>
	<article><tiles:insertAttribute name="content"/></article>
	<footer><tiles:insertAttribute name="footer"/></footer>
</div>
</body>
</html>




















	