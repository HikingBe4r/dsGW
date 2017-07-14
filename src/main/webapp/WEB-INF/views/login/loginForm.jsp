<%-- loginForm.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

<form action="${pageContext.request.contextPath }/login.do"
	method="post">
	<div class="panel panel-default">
		<div class="panel-body">
			<div class="container">
				<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
					<div class="panel panel-success">
						<div class="panel-heading">
							<div class="panel-title">환영합니다!</div>
						</div>
						<div class="panel-body">
							<div>
								<input name="select" type="radio" value="admin"> 관리자 
								<input name="select" type="radio" value="employee"> 일반사원
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
							<div>
								<button type="button" class="form-control btn btn-default"
									onClick="window.open('${pageContext.request.contextPath }/findEmployeeId.do','사번/비밀번호 찾기','width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes');return false;">
									사번찾기 / 비밀번호 변경</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>