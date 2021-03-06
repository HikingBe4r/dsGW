<%-- loginForm.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<script	src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js"></script>

<style>
html, body {
	width: 100%;
	height: 100%;
}

.container {
	width: 70%;
	height: 70%;
	margin: 40px auto;
}

.outer {
	display: table;
	width: 100%;
	height: 100%;
}

.inner {
	display: table-cell;
	vertical-align: middle;
	text-align: center;
}

.centered {
	position: relative;
	display: inline-block;
	width: 50%;
	height: 30%;
	padding: 1em;
	background: #ccff66;
	color: #336699;
	text-align: left;
}
</style>
<body>
	<form action="${pageContext.request.contextPath }/login.do"
		method="post">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="container">
					<div class="outer">
						<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
							<div class="panel panel-success">
								<div class="panel-heading">
									<div class="panel-title">환영합니다!</div>
								</div>
								<div class="panel-body">
									<div>
										<input name="select" type="radio" value="employee" checked>
										일반사원 <input name="select" type="radio" value="admin">
										관리자
									</div>

									<div>
										<input type="text" class="form-control" name="employeeId"
											placeholder="Employee ID" autofocus>
									</div>
									<div>
										<input type="password" class="form-control" name="password"
											placeholder="Password">
									</div>
									<div>
										<button type="submit" class="form-control btn btn-primary">로그인</button>
									</div>
									<div style="margin: auto">
										<button type="button" class="form-control btn btn-default"
											onClick="window.open('${pageContext.request.contextPath }/findEmployeeId.do','사번/비밀번호 찾기','width=600, height=450, toolbar=no, menubar=no, scrollbars=no, resizable=yes');return false;">
											사번찾기 / 비밀번호 변경</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>